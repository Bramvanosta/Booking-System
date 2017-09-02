import { ActionReducerMap } from '@ngrx/store';

import * as fromAuthentication from '../authentication/store/authentication.reducers';
import * as fromCampgrounds from '../dashboard/campgrounds/store/campgrounds.reducers';
import * as fromBookings from '../dashboard/bookings/store/bookings.reducers';

export interface AppState {
  authentication: fromAuthentication.State;
  campgrounds: fromCampgrounds.State;
  bookings: fromBookings.State;
}

export const reducers: ActionReducerMap<AppState> = {
  authentication: fromAuthentication.authenticationReducer,
  campgrounds: fromCampgrounds.campgroundsReducer,
  bookings: fromBookings.bookingsReducer
};
