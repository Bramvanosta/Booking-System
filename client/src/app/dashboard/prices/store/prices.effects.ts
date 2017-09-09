import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { MdSnackBar } from '@angular/material';

import { Action, Store } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/mergeMap';
import 'rxjs/add/operator/take';

import * as PricesActions from './prices.actions';
import * as fromApp from '../../../store/app.reducers';
import * as fromCampgrounds from '../../campgrounds/store/campgrounds.reducers';

import { Season } from '../season.model';
import { Price } from '../price.model';

@Injectable()
export class PricesEffects {

  @Effect() fetchSeasons: Observable<Action> = this.actions$
    .ofType(PricesActions.FETCH_SEASONS)
    .mergeMap(() => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<Season[]>(`campgrounds/${campgroundsState.currentCampground.id}/seasons`)
            .map((seasons: Season[]) => {
              return {
                type: PricesActions.SET_SEASONS,
                payload: seasons
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new PricesActions.OnPriceError(errorMessage));
            })
        })
    });

  @Effect() fetchPrices: Observable<Action> = this.actions$
    .ofType(PricesActions.FETCH_PRICES)
    .map(toPayload)
    .mergeMap((payload: { seasonId: number, rentalCategoryId: number }) => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<Price[]>(`campgrounds/${campgroundsState.currentCampground.id}/rental_categories/${payload.rentalCategoryId}/seasons/${payload.seasonId}/prices`)
            .map((prices: Price[]) => {
              return {
                type: PricesActions.SET_PRICES,
                payload: {
                  seasonId: payload.seasonId,
                  rentalCategoryId: payload.rentalCategoryId,
                  prices
                }
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new PricesActions.OnPriceError(errorMessage));
            })
        })
    });

  @Effect({ dispatch: false }) onPriceError = this.actions$
    .ofType(PricesActions.ON_PRICE_ERROR)
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
