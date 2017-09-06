import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { MdSnackBar } from '@angular/material';

import {Action, Store} from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/observable/of';

import * as CampgroundsActions from './campgrounds.actions';
import * as fromApp from '../../../store/app.reducers';
import * as fromCampgrounds from '../../campgrounds/store/campgrounds.reducers';

import { Campground } from '../campground.model';
import {Rights} from "../rights.model";

@Injectable()
export class CampgroundsEffects {

  @Effect() campgroundsFetchCampgrounds: Observable<Action> = this.actions$
    .ofType(CampgroundsActions.FETCH_CAMPGROUNDS)
    .mergeMap(() => {
      return this.httpClient.get<Campground[]>('campgrounds')
        .map((campgrounds: Campground[]) => {
          const formattedCampgrounds = campgrounds.map((campground) => {
            return { id: campground.id, name: campground.name, logo_url: campground.logo_url }
          });
          return {
            type: CampgroundsActions.SET_CAMPGROUNDS,
            payload: formattedCampgrounds
          };
        })
        .catch((errorResponse: HttpErrorResponse) => {
          const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
          return Observable.of(new CampgroundsActions.OnCampgroundsError(errorMessage));
        })
    });

  @Effect() campgroundsSetCampgrounds: Observable<Action> = this.actions$
    .ofType(CampgroundsActions.SET_CAMPGROUNDS)
    .map(toPayload)
    .map((payload: Campground[]) => {
      let currentCampgroundId = parseInt(localStorage.getItem('current-campground-id'));
      if (!currentCampgroundId || !payload.find((campground) => currentCampgroundId === campground.id)) {
        currentCampgroundId = payload[0].id;
      }
      return {
        type: CampgroundsActions.SET_CURRENT_CAMPGROUND,
        payload: currentCampgroundId
      };
    });

  @Effect() campgroundsSetCurrentCampground: Observable<Action> = this.actions$
    .ofType(CampgroundsActions.SET_CURRENT_CAMPGROUND)
    .map(toPayload)
    .map((payload: number) => {
      localStorage.setItem('current-campground-id', `${payload}`);
      return {
        type: CampgroundsActions.FETCH_RIGHTS
      };
    });

  @Effect() campgroundsFetchRights: Observable<Action> = this.actions$
    .ofType(CampgroundsActions.FETCH_RIGHTS)
    .mergeMap(() => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<Rights>(`campgrounds/${campgroundsState.currentCampground.id}/rights`)
            .map((rights: Rights) => {
              return {
                type: CampgroundsActions.SET_RIGHTS,
                payload: rights
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new CampgroundsActions.OnCampgroundsError(errorMessage));
            })
        })
    });

  @Effect({ dispatch: false }) campgroundsOnError = this.actions$
    .ofType(CampgroundsActions.ON_CAMPGROUNDS_ERROR)
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
