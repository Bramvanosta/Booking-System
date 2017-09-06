import { Action } from '@ngrx/store';
import { Campground } from '../campground.model';
import {Rights} from "../rights.model";

export const FETCH_CAMPGROUNDS = 'FETCH_CAMPGROUNDS';
export const SET_CAMPGROUNDS = 'SET_CAMPGROUNDS';
export const SET_CURRENT_CAMPGROUND = 'SET_CURRENT_CAMPGROUND';
export const ON_CAMPGROUNDS_ERROR = 'ON_CAMPGROUNDS_ERROR';
export const FETCH_RIGHTS = 'FETCH_RIGHTS';
export const SET_RIGHTS = 'SET_RIGHTS';

export class FetchCampgrounds implements Action {
  readonly type = FETCH_CAMPGROUNDS;
}

export class SetCampgrounds implements Action {
  readonly type = SET_CAMPGROUNDS;

  constructor(public payload: Campground[]) {
  }
}

export class SetCurrentCampground implements Action {
  readonly type = SET_CURRENT_CAMPGROUND;

  constructor(public payload: number) {
  }
}

export class FetchRights implements Action {
  readonly type = FETCH_RIGHTS;
}

export class SetRights implements Action {
  readonly type = SET_RIGHTS;

  constructor(public payload: Rights) {
  }
}

export class OnCampgroundsError implements Action {
  readonly type = ON_CAMPGROUNDS_ERROR;

  constructor(public payload: string) {
  }
}

export type CampgroundsActions =
  FetchCampgrounds |
  SetCampgrounds |
  SetCurrentCampground |
  FetchRights |
  SetRights |
  OnCampgroundsError;
