import { RentalCategory } from '../rental-category.model';

import * as RentalsActions from './rentals.actions';
import { Rental } from '../rental.model';

export interface State {
  rentalCategories: RentalCategory[]
  rentals: {
    [rentalCategoryId: number]: Rental[]
  }
}

const initialState: State = {
  rentalCategories: [],
  rentals: {}
};

export function rentalsReducer(state = initialState, action: RentalsActions.RentalsActions) {
  switch (action.type) {
    case (RentalsActions.SET_RENTAL_CATEGORIES):
      return {
        ...state,
        rentalCategories: action.payload
      };
    case (RentalsActions.SET_RENTALS):
      return {
        ...state,
        rentals: {
          ...state.rentals,
          [action.payload.id]: action.payload.rentals
        }
      };
    case (RentalsActions.ON_RENTAL_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
