import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { MdSnackBar } from '@angular/material';

import { Action, Store } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/observable/of';

import * as RightsActions from './rights.actions';
import * as fromApp from '../../../store/app.reducers';
import * as fromCampgrounds from '../../campgrounds/store/campgrounds.reducers';

import { Rights } from '../rights.model';

@Injectable()
export class RightsEffects {

  @Effect() fetchRights: Observable<Action> = this.actions$
    .ofType(RightsActions.FETCH_RIGHTS)
    .mergeMap(() => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<Rights>(`campgrounds/${campgroundsState.currentCampground.id}/rights`)
            .map((rights: Rights) => {
              return {
                type: RightsActions.SET_RIGHTS,
                payload: rights
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new RightsActions.OnRightsError(errorMessage));
            })
        })
    });

  @Effect({ dispatch: false }) onRightsError = this.actions$
    .ofType(RightsActions.ON_RIGHTS_ERROR)
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
