import * as PricesActions from './prices.actions';

import { Season } from '../season.model';
import { Price } from '../price.model';

export interface State {
  seasons: Season[],
  prices: {
    [seasonId: number]: {
      [rentalCategoryId: number]: Price[]
    }
  }
}

const initialState: State = {
  seasons: [],
  prices: {}
};

export function pricesReducer(state = initialState, action: PricesActions.PricesActions) {
  switch (action.type) {
    case (PricesActions.SET_SEASONS):
      return {
        ...state,
        seasons: action.payload
      };
    case (PricesActions.SET_PRICES):
      return {
        ...state,
        prices: {
          ...state.prices,
          [action.payload.seasonId]: {
            ...state.prices[action.payload.seasonId],
            [action.payload.rentalCategoryId]: action.payload.prices
          }
        }
      };
    case (PricesActions.ON_PRICE_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
