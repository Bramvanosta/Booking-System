import { Action } from '@ngrx/store';

export const TRY_SIGNIN = 'TRY_SIGNIN';
export const SIGNIN = 'SIGNIN';
export const TRY_RESET_PASSWORD = 'TRY_RESET_PASSWORD';
export const RESET_PASSWORD = 'RESET_PASSWORD';
export const TRY_UPDATE_PASSWORD = 'TRY_UPDATE_PASSWORD';
export const UPDATE_PASSWORD = 'UPDATE_PASSWORD';
export const LOGOUT = 'LOGOUT';
export const TRY_AUTHENTICATION_VERIFICATION = 'TRY_AUTHENTICATION_VERIFICATION';
export const SET_AUTHENTICATION_INFO = 'SET_AUTHENTICATION_INFO';
export const ON_AUTHENTICATION_ERROR = 'ON_AUTHENTICATION_ERROR';

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

export class TryResetPassword implements Action {
  readonly type = TRY_RESET_PASSWORD;

  constructor(public payload: string) {
  }
}

export class ResetPassword implements Action {
  readonly type = RESET_PASSWORD;

  constructor(public payload: string) {
  }
}

export class TryUpdatePassword implements Action {
  readonly type = TRY_UPDATE_PASSWORD;

  constructor(public payload: { password: string, passwordConfirmation: string, resetPasswordToken: string }) {
  }
}

export class UpdatePassword implements Action {
  readonly type = UPDATE_PASSWORD;

  constructor(public payload: string) {
  }
}

export class Logout implements Action {
  readonly type = LOGOUT;
}

export class TryAuthenticationVerification implements Action {
  readonly type = TRY_AUTHENTICATION_VERIFICATION;
}

export class SetAuthenticationInfo implements Action {
  readonly type = SET_AUTHENTICATION_INFO;

  constructor(public payload: { token: string, client: string, expiry: string, uid: string }) {
  }
}

export class OnAuthenticationError implements Action {
  readonly type = ON_AUTHENTICATION_ERROR;

  constructor(public payload: string) {
  }
}

export type AuthenticationActions =
  TrySignin |
  Signin |
  TryResetPassword |
  ResetPassword |
  TryUpdatePassword |
  UpdatePassword |
  Logout |
  TryAuthenticationVerification |
  SetAuthenticationInfo |
  OnAuthenticationError;
