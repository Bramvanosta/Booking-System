import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Action } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/switchMap';
import 'rxjs/add/operator/mergeMap';

import * as AuthenticationActions from './authentication.actions';
import { User } from '../../shared/user/user.model';

@Injectable()
export class AuthenticationEffects {

  @Effect() authenticationSignin: Observable<Action> = this.actions$
    .ofType(AuthenticationActions.TRY_SIGNIN)
    .map(toPayload)
    .mergeMap((payload: { email: string, password: string }) => {
      return this.httpClient.post('http://api.booking-system.dev/v1/auth/sign_in', {
        email: payload.email,
        password: payload.password
      })
        .map((data: { email: string, first_name: string, last_name: string }) => {
          console.log('test');
          return {
            type: AuthenticationActions.SIGNIN,
            payload: {
              email: data.email,
              firstName: data.first_name,
              lastName: data.last_name
            }
          }
        })
    });

  constructor(private actions$: Actions, private httpClient: HttpClient) {
  }
}
