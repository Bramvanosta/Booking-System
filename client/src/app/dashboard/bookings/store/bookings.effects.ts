import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { MdSnackBar } from '@angular/material';

import { Action, Store } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/mergeMap';
import 'rxjs/add/operator/take';

import * as BookingsActions from './bookings.actions';
import * as fromApp from '../../../store/app.reducers';
import * as fromCampgrounds from '../../campgrounds/store/campgrounds.reducers';

import { Booking } from '../booking.model';

@Injectable()
export class BookingsEffects {

  @Effect() fetchBookings: Observable<Action> = this.actions$
    .ofType(BookingsActions.FETCH_BOOKINGS)
    .mergeMap(() => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<Booking[]>(`campgrounds/${campgroundsState.currentCampground.id}/bookings`)
            .map((bookings: Booking[]) => {
              const formattedBookings = bookings.map((booking) => {
                return {
                  id: booking.id,
                  status: booking.status,
                  arrival_date: booking.arrival_date,
                  departure_date: booking.departure_date,
                  client: booking.client
                }
              });
              return {
                type: BookingsActions.SET_BOOKINGS,
                payload: formattedBookings
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new BookingsActions.OnBookingsError(errorMessage));
            })
        })
    });

  @Effect({ dispatch: false }) onBookingsError = this.actions$
    .ofType(BookingsActions.ON_BOOKINGS_ERROR)
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
