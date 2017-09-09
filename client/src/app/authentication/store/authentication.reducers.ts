import * as AuthenticationActions from './authentication.actions';

import { User } from '../user.model';

export interface State {
  user: User;
  token: string;
  client: string;
  expiry: string;
  uid: string;
  authenticated: boolean;
  loading: boolean;
}

const initialState: State = {
  user: null,
  token: null,
  client: null,
  expiry: null,
  uid: null,
  authenticated: false,
  loading: false
};

export function authenticationReducer(state = initialState, action: AuthenticationActions.AuthenticationActions) {
  switch (action.type) {
    case (AuthenticationActions.TRY_SIGNIN):
      return {
        ...state,
        loading: true
      };
    case (AuthenticationActions.SIGNIN):
      return {
        ...state,
        user: action.payload,
        authenticated: true,
        loading: false,
      };
    case (AuthenticationActions.TRY_RESET_PASSWORD):
      return {
        ...state,
        loading: true
      };
    case (AuthenticationActions.RESET_PASSWORD):
      return { ...initialState };
    case (AuthenticationActions.TRY_UPDATE_PASSWORD):
      return {
        ...state,
        loading: true
      };
    case (AuthenticationActions.UPDATE_PASSWORD):
      return { ...initialState };
    case (AuthenticationActions.SET_AUTHENTICATION_INFO):
      return {
        ...state,
        ...action.payload
      };
    case (AuthenticationActions.ON_AUTHENTICATION_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
