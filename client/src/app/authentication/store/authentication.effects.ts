import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';
import { MdSnackBar } from '@angular/material';

import { Action } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/mergeMap';
import 'rxjs/add/observable/of';
import 'rxjs/add/observable/empty';

import * as AuthenticationActions from './authentication.actions';

@Injectable()
export class AuthenticationEffects {

  @Effect() authenticationSignin: Observable<Action | any> = this.actions$
    .ofType(AuthenticationActions.TRY_SIGNIN)
    .map(toPayload)
    .mergeMap((payload: { email: string, password: string }) => {
      return this.httpClient.post('http://api.booking-system.dev/v1/auth/sign_in', {
        email: payload.email,
        password: payload.password
      })
        .map((data: { email: string, first_name: string, last_name: string }) => {
          this.router.navigate(['/dashboard']);
          return {
            type: AuthenticationActions.SIGNIN,
            payload: {
              email: data.email,
              firstName: data.first_name,
              lastName: data.last_name
            }
          }
        })
        .catch((errorResponse: HttpErrorResponse) => {
          const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
          this.snackBar.open(errorMessage, 'hide', { duration: 6000 });
          return Observable.of(new AuthenticationActions.OnError());
        })
    });

  @Effect() authenticationResetPassword: Observable<Action | any> = this.actions$
    .ofType(AuthenticationActions.TRY_RESET_PASSWORD)
    .map(toPayload)
    .mergeMap((payload: string) => {
      return this.httpClient.post('http://api.booking-system.dev/v1/auth/password', {
        email: payload,
        redirect_url: 'http://booking-system.dev/update-password'
      })
        .map((data: { message: string }) => {
          this.snackBar.open(data.message, 'hide', { duration: 6000 });
          this.router.navigate(['/']);
          return {
            type: AuthenticationActions.RESET_PASSWORD
          }
        })
        .catch((errorResponse: HttpErrorResponse) => {
          const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
          this.snackBar.open(errorMessage, 'hide', { duration: 6000 });
          return Observable.of(new AuthenticationActions.OnError());
        })
    });

  @Effect() authenticationUpdatePassword: Observable<Action | any> = this.actions$
    .ofType(AuthenticationActions.TRY_UPDATE_PASSWORD)
    .map(toPayload)
    .mergeMap((payload: { password: string, passwordConfirmation: string, resetPasswordToken: string }) => {
      return this.httpClient.put('http://api.booking-system.dev/v1/auth/password', {
        password: payload.password,
        password_confirmation: payload.passwordConfirmation,
        reset_password_token: payload.resetPasswordToken
      })
        .map((data: { message: string }) => {
          this.snackBar.open(data.message, 'hide', { duration: 6000 });
          this.router.navigate(['/']);
          return {
            type: AuthenticationActions.RESET_PASSWORD
          }
        })
        .catch((errorResponse: HttpErrorResponse) => {
          const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
          this.snackBar.open(errorMessage, 'hide', { duration: 6000 });
          return Observable.of(new AuthenticationActions.OnError());
        })
    });

  @Effect({ dispatch: false }) authenticationSetAuthenticationInfo = this.actions$
    .ofType(AuthenticationActions.SET_AUTHENTICATION_INFO)
    .map(toPayload)
    .do((payload: { token: string, client: string, expiry: string, uid: string }) => {
      localStorage.setItem('access-token', payload.token);
      localStorage.setItem('client', payload.client);
      localStorage.setItem('expiry', payload.expiry);
      localStorage.setItem('uid', payload.uid);
    });

  @Effect({ dispatch: false }) authenticationLogout = this.actions$
    .ofType(AuthenticationActions.LOGOUT)
    .do(() => {
      localStorage.removeItem('access-token');
      localStorage.removeItem('client');
      localStorage.removeItem('expiry');
      localStorage.removeItem('uid');
      this.router.navigate(['/']);
    });

  constructor(private actions$: Actions,
              private httpClient: HttpClient,
              private router: Router,
              private snackBar: MdSnackBar) {
  }
}
