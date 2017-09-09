import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { MdSnackBar } from '@angular/material';

import { Action, Store } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/mergeMap';
import 'rxjs/add/operator/take';

import * as UsersActions from './users.actions';
import * as fromApp from '../../../store/app.reducers';
import * as fromCampgrounds from '../../campgrounds/store/campgrounds.reducers';

import { User } from '../user.model';

@Injectable()
export class UsersEffects {

  @Effect() fetchUsers: Observable<Action> = this.actions$
    .ofType(UsersActions.FETCH_USERS)
    .mergeMap(() => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<User[]>(`campgrounds/${campgroundsState.currentCampground.id}/users`)
            .map((users: User[]) => {
              return {
                type: UsersActions.SET_USERS,
                payload: users
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new UsersActions.OnUsersError(errorMessage));
            })
        })
    });

  @Effect({ dispatch: false }) onUsersError = this.actions$
    .ofType(UsersActions.ON_USERS_ERROR)
    .map(toPayload)
    .do((payload: string) => {
      this.snackBar.open(payload, 'hide', { duration: 6000 });
    });

  constructor(private actions$: Actions,
              private store: Store<fromApp.AppState>,
              private httpClient: HttpClient,
              private snackBar: MdSnackBar) {
  }
}
