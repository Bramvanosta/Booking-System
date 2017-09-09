import { Action } from '@ngrx/store';

import { RentalCategory } from '../rental-category.model';
import { Rental } from '../rental.model';

export const FETCH_RENTAL_CATEGORIES = 'FETCH_RENTAL_CATEGORIES';
export const SET_RENTAL_CATEGORIES = 'SET_RENTAL_CATEGORIES';
export const FETCH_RENTALS = 'FETCH_RENTALS';
export const SET_RENTALS = 'SET_RENTALS';
export const ON_RENTAL_ERROR = 'ON_RENTAL_ERROR';

export class FetchRentalCategories implements Action {
  readonly type = FETCH_RENTAL_CATEGORIES;
}

export class SetRentalCategories implements Action {
  readonly type = SET_RENTAL_CATEGORIES;

  constructor(public payload: RentalCategory[]) {
  }
}

export class FetchRentals implements Action {
  readonly type = FETCH_RENTALS;

  constructor(public payload: number) {
  }
}

export class SetRentals implements Action {
  readonly type = SET_RENTALS;

  constructor(public payload: { id: number, rentals: Rental[] }) {
  }
}

export class OnRentalError implements Action {
  readonly type = ON_RENTAL_ERROR;

  constructor(public payload: string) {
  }
}

export type RentalsActions =
  FetchRentalCategories |
  SetRentalCategories |
  FetchRentals |
  SetRentals |
  OnRentalError;
