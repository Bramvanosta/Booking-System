import { Booking } from '../booking.model';

import * as BookingsActions from './bookings.actions';

export interface State {
  bookings: Booking[];
}

const initialState: State = {
  bookings: []
};

export function bookingsReducer(state = initialState, action: BookingsActions.BookingsActions) {
  switch (action.type) {
    case (BookingsActions.SET_BOOKINGS):
      return {
        ...state,
        bookings: action.payload
      };
    case (BookingsActions.ON_BOOKINGS_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
