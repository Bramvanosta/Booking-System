import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';
import { MdSnackBar } from '@angular/material';

import { Action, Store } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import { defer } from 'rxjs/observable/defer';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/mergeMap';
import 'rxjs/add/observable/of';
import 'rxjs/add/observable/empty';

import * as fromApp from '../../store/app.reducers';
import * as AuthenticationActions from './authentication.actions';
import { User } from '../user.model';

@Injectable()
export class AuthenticationEffects {

  @Effect() signin: Observable<Action | any> = this.actions$
    .ofType(AuthenticationActions.TRY_SIGNIN)
    .map(toPayload)
    .mergeMap((payload: { email: string, password: string }) => {
      return this.httpClient.post('auth/sign_in', {
        email: payload.email,
        password: payload.password
      })
        .map((json: { data }) => json.data)
        .map((user: User) => {
          this.router.navigate(['/dashboard']);
          return {
            type: AuthenticationActions.SIGNIN,
            payload: {
              id: user.id,
              email: user.email,
              first_name: user.first_name,
              last_name: user.last_name
            }
          }
        })
        .catch((errorResponse: HttpErrorResponse) => {
          const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
          return Observable.of(new AuthenticationActions.OnAuthenticationError(errorMessage));
        })
    });

  @Effect() resetPassword: Observable<Action | any> = this.actions$
    .ofType(AuthenticationActions.TRY_RESET_PASSWORD)
    .map(toPayload)
    .mergeMap((payload: string) => {
      return this.httpClient.post('auth/password', {
        email: payload,
        redirect_url: 'http://booking-system.dev/update-password'
      })
        .map((data: { message: string }) => {
          this.snackBar.open(data.message, 'hide', { duration: 6000 });
          this.router.navigate(['/login']);
          return {
            type: AuthenticationActions.RESET_PASSWORD
          }
        })
        .catch((errorResponse: HttpErrorResponse) => {
          const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
          return Observable.of(new AuthenticationActions.OnAuthenticationError(errorMessage));
        })
    });

  @Effect() updatePassword: Observable<Action | any> = this.actions$
    .ofType(AuthenticationActions.TRY_UPDATE_PASSWORD)
    .map(toPayload)
    .mergeMap((payload: { password: string, passwordConfirmation: string, resetPasswordToken: string }) => {
      return this.httpClient.put('uth/password', {
        password: payload.password,
        password_confirmation: payload.passwordConfirmation,
        reset_password_token: payload.resetPasswordToken
      })
        .map((data: { message: string }) => {
          this.snackBar.open(data.message, 'hide', { duration: 6000 });
          this.router.navigate(['/login']);
          return {
            type: AuthenticationActions.RESET_PASSWORD
          }
        })
        .catch((errorResponse: HttpErrorResponse) => {
          const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
          return Observable.of(new AuthenticationActions.OnAuthenticationError(errorMessage));
        })
    });

  @Effect({ dispatch: false }) setAuthenticationInfo = this.actions$
    .ofType(AuthenticationActions.SET_AUTHENTICATION_INFO)
    .map(toPayload)
    .do((payload: { token: string, client: string, expiry: string, uid: string }) => {
      localStorage.setItem('access-token', payload.token);
      localStorage.setItem('client', payload.client);
      localStorage.setItem('expiry', payload.expiry);
      localStorage.setItem('uid', payload.uid);
    });

  @Effect({ dispatch: false }) logout = this.actions$
    .ofType(AuthenticationActions.LOGOUT)
    .do(() => {
      localStorage.removeItem('access-token');
      localStorage.removeItem('client');
      localStorage.removeItem('expiry');
      localStorage.removeItem('uid');
      localStorage.removeItem('current-campground-id');
      this.router.navigate(['/login']);
    });

  @Effect() authenticationVerification = this.actions$
    .ofType(AuthenticationActions.TRY_AUTHENTICATION_VERIFICATION)
    .mergeMap(() => {
      return this.httpClient.get('auth/validate_token')
        .map((json: { data }) => json.data)
        .map((user: User) => {
          this.router.navigate(['/dashboard']);
          return {
            type: AuthenticationActions.SIGNIN,
            payload: {
              id: user.id,
              email: user.email,
              first_name: user.first_name,
              last_name: user.last_name
            }
          }
        })
        .catch((errorResponse: HttpErrorResponse) => {
          const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
          return Observable.of(new AuthenticationActions.OnAuthenticationError(errorMessage));
        })
    });

  @Effect({ dispatch: false }) onAuthentificationError = this.actions$
    .ofType(AuthenticationActions.ON_AUTHENTICATION_ERROR)
    .map(toPayload)
    .do((payload: string) => {
      this.snackBar.open(payload, 'hide', { duration: 6000 });
    });

  @Effect() authenticationInit = defer(() => {
    const token = localStorage.getItem('access-token');
    const client = localStorage.getItem('client');
    const expiry = localStorage.getItem('expiry');
    const uid = localStorage.getItem('uid');
    if (token && client && uid) {
      this.store.dispatch(new AuthenticationActions.SetAuthenticationInfo({ token, client, expiry, uid }));
      return Observable.of(new AuthenticationActions.TryAuthenticationVerification());
    }
  });

  constructor(private actions$: Actions,
              private store: Store<fromApp.AppState>,
              private httpClient: HttpClient,
              private router: Router,
              private snackBar: MdSnackBar) {
  }
}
