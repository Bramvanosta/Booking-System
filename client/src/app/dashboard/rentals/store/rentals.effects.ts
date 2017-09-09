import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { MdSnackBar } from '@angular/material';

import { Action, Store } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/mergeMap';
import 'rxjs/add/operator/take';

import * as RentalsActions from './rentals.actions';
import * as fromApp from '../../../store/app.reducers';
import * as fromCampgrounds from '../../campgrounds/store/campgrounds.reducers';
import { RentalCategory } from '../rental-category.model';
import { Rental } from '../rental.model';

@Injectable()
export class RentalsEffects {

  @Effect() fetchRentalCategories: Observable<Action> = this.actions$
    .ofType(RentalsActions.FETCH_RENTAL_CATEGORIES)
    .mergeMap(() => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<RentalCategory[]>(`campgrounds/${campgroundsState.currentCampground.id}/rental_categories`)
            .map((rentalCategories: RentalCategory[]) => {
              return {
                type: RentalsActions.SET_RENTAL_CATEGORIES,
                payload: rentalCategories
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new RentalsActions.OnRentalError(errorMessage));
            })
        })
    });

  @Effect() fetchRentals: Observable<Action> = this.actions$
    .ofType(RentalsActions.FETCH_RENTALS)
    .map(toPayload)
    .mergeMap((payload: number) => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<Rental[]>(`campgrounds/${campgroundsState.currentCampground.id}/rental_categories/${payload}/rentals`)
            .map((rentals: Rental[]) => {
              return {
                type: RentalsActions.SET_RENTALS,
                payload: {
                  id: payload,
                  rentals
                }
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new RentalsActions.OnRentalError(errorMessage));
            })
        })
    });

  @Effect({ dispatch: false }) onRentalError = this.actions$
    .ofType(RentalsActions.ON_RENTAL_ERROR)
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
