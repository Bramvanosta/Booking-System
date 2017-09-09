import { Action } from '@ngrx/store';

import { ApiKey } from '../api-key.model';

export const FETCH_API_KEYS = 'FETCH_API_KEYS';
export const SET_API_KEYS = 'SET_API_KEYS';
export const ON_API_KEYS_ERROR = 'ON_API_KEYS_ERROR';

export class FetchApiKeys implements Action {
  readonly type = FETCH_API_KEYS;
}

export class SetApiKeys implements Action {
  readonly type = SET_API_KEYS;

  constructor(public payload: ApiKey[]) {
  }
}

export class OnApiKeysError implements Action {
  readonly type = ON_API_KEYS_ERROR;

  constructor(public payload: string) {
  }
}

export type ApiKeysActions =
  FetchApiKeys |
  SetApiKeys |
  OnApiKeysError;
