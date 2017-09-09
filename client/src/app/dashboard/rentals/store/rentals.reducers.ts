import { RentalCategory } from '../rental-category.model';

import * as RentalsActions from './rentals.actions';

export interface State {
  rentalCategories: RentalCategory[]
}

const initialState: State = {
  rentalCategories: []
};

export function rentalsReducer(state = initialState, action: RentalsActions.RentalsActions) {
  switch (action.type) {
    case (RentalsActions.SET_RENTAL_CATEGORIES):
      return {
        ...state,
        rentalCategories: action.payload
      };
    case (RentalsActions.SET_RENTALS):
      const newRentalCategories = state.rentalCategories.map((rentalCategory) => (
        rentalCategory.id === action.payload.id ? {
          ...rentalCategory,
          rentals: action.payload.rentals
        } : rentalCategory
      ));
      return {
        ...state,
        rentalCategories: newRentalCategories
      };
    case (RentalsActions.ON_RENTAL_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
