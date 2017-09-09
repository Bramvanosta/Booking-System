import { Action } from '@ngrx/store';

import { User } from '../user.model';

export const FETCH_USERS = 'FETCH_USERS';
export const SET_USERS = 'SET_USERS';
export const ON_USERS_ERROR = 'ON_USERS_ERROR';

export class FetchUsers implements Action {
  readonly type = FETCH_USERS;
}

export class SetUsers implements Action {
  readonly type = SET_USERS;

  constructor(public payload: User[]) {
  }
}

export class OnUsersError implements Action {
  readonly type = ON_USERS_ERROR;

  constructor(public payload: string) {
  }
}

export type UsersActions =
  FetchUsers |
  SetUsers |
  OnUsersError;
