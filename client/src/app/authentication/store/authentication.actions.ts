import { Action } from '@ngrx/store';

export const TRY_SIGNIN = 'TRY_SIGNIN';
export const SIGNIN = 'SIGNIN';
export const LOGOUT = 'LOGOUT';
export const SET_AUTHENTICATION_INFO = 'SET_AUTHENTICATION_INFO';

export class TrySignin implements Action {
  readonly type = TRY_SIGNIN;

  constructor(public payload: { email: string, password: string }) {
  }
}

export class Signin implements Action {
  readonly type = SIGNIN;

  constructor(public payload: { email: string, firstName: string, lastName: string }) {
  }
}

export class Logout implements Action {
  readonly type = LOGOUT;
}

export class SetAuthenticationInfo implements Action {
  readonly type = SET_AUTHENTICATION_INFO;

  constructor(public payload: { token: string, client: string, expiry: string, uid: string }) {
  }
}

export type AuthenticationActions = TrySignin | Signin | Logout | SetAuthenticationInfo;
