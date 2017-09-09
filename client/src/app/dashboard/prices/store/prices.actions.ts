import { Action } from '@ngrx/store';

import { Season } from '../season.model';
import { Price } from '../price.model';

export const FETCH_SEASONS = 'FETCH_SEASONS';
export const SET_SEASONS = 'SET_SEASONS';
export const FETCH_PRICES = 'FETCH_PRICES';
export const SET_PRICES = 'SET_PRICES';
export const ON_PRICE_ERROR = 'ON_PRICE_ERROR';

export class FetchSeasons implements Action {
  readonly type = FETCH_SEASONS;
}

export class SetSeasons implements Action {
  readonly type = SET_SEASONS;

  constructor(public payload: Season[]) {
  }
}

export class FetchPrices implements Action {
  readonly type = FETCH_PRICES;

  constructor(public payload: { seasonId: number, rentalCategoryId: number }) {
  }
}

export class SetPrices implements Action {
  readonly type = SET_PRICES;

  constructor(public payload: { seasonId: number, rentalCategoryId: number, prices: Price[] }) {
  }
}

export class OnPriceError implements Action {
  readonly type = ON_PRICE_ERROR;

  constructor(public payload: string) {
  }
}

export type PricesActions =
  FetchSeasons |
  SetSeasons |
  FetchPrices |
  SetPrices |
  OnPriceError;
