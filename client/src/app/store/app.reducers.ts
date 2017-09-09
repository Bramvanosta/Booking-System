import { ActionReducerMap } from '@ngrx/store';

import * as fromAuthentication from '../authentication/store/authentication.reducers';
import * as fromCampgrounds from '../dashboard/campgrounds/store/campgrounds.reducers';
import * as fromBookings from '../dashboard/bookings/store/bookings.reducers';
import * as fromClients from '../dashboard/clients/store/clients.reducers';
import * as fromRights from '../dashboard/rights/store/rights.reducers';
import * as fromRentals from '../dashboard/rentals/store/rentals.reducers';

export interface AppState {
  authentication: fromAuthentication.State;
  campgrounds: fromCampgrounds.State;
  bookings: fromBookings.State;
  clients: fromClients.State;
  rights: fromRights.State;
  rentals: fromRentals.State;
}

export const reducers: ActionReducerMap<AppState> = {
  authentication: fromAuthentication.authenticationReducer,
  campgrounds: fromCampgrounds.campgroundsReducer,
  bookings: fromBookings.bookingsReducer,
  clients: fromClients.clientsReducer,
  rights: fromRights.rightsReducer,
  rentals: fromRentals.rentalsReducer
};
