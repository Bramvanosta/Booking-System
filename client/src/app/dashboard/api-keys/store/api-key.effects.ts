import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { MdSnackBar } from '@angular/material';

import { Action, Store } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/mergeMap';
import 'rxjs/add/operator/take';

import * as ApiKeysActions from './api-key.actions';
import * as fromApp from '../../../store/app.reducers';
import * as fromCampgrounds from '../../campgrounds/store/campgrounds.reducers';

import { ApiKey } from '../api-key.model';

@Injectable()
export class ApiKeysEffects {

  @Effect() fetchBookings: Observable<Action> = this.actions$
    .ofType(ApiKeysActions.FETCH_API_KEYS)
    .mergeMap(() => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<ApiKey[]>(`campgrounds/${campgroundsState.currentCampground.id}/api_keys`)
            .map((apiKeys: ApiKey[]) => {
              return {
                type: ApiKeysActions.SET_API_KEYS,
                payload: apiKeys
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new ApiKeysActions.OnApiKeysError(errorMessage));
            })
        })
    });

  @Effect({ dispatch: false }) onBookingsError = this.actions$
    .ofType(ApiKeysActions.ON_API_KEYS_ERROR)
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
