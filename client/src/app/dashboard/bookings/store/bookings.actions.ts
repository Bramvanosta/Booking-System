import { Action } from '@ngrx/store';
import { Booking } from '../booking.model';

export const FETCH_BOOKINGS = 'FETCH_BOOKINGS';
export const SET_BOOKINGS = 'SET_BOOKINGS';
export const ON_BOOKINGS_ERROR = 'ON_BOOKINGS_ERROR';

export class FetchBookings implements Action {
  readonly type = FETCH_BOOKINGS;
}

export class SetBookings implements Action {
  readonly type = SET_BOOKINGS;

  constructor(public payload: Booking[]) {
  }
}

export class OnBookingsError implements Action {
  readonly type = ON_BOOKINGS_ERROR;

  constructor(public payload: string) {
  }
}

export type BookingsActions =
  FetchBookings |
  SetBookings |
  OnBookingsError;
