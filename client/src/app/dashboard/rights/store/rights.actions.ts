import { Action } from '@ngrx/store';

import { Rights } from '../rights.model';

export const FETCH_RIGHTS = 'FETCH_RIGHTS';
export const SET_RIGHTS = 'SET_RIGHTS';
export const ON_RIGHTS_ERROR = 'ON_RIGHTS_ERROR';

export class FetchRights implements Action {
  readonly type = FETCH_RIGHTS;
}

export class SetRights implements Action {
  readonly type = SET_RIGHTS;

  constructor(public payload: Rights) {
  }
}

export class OnRightsError implements Action {
  readonly type = ON_RIGHTS_ERROR;

  constructor(public payload: string) {
  }
}

export type RightsActions =
  FetchRights |
  SetRights |
  OnRightsError;
