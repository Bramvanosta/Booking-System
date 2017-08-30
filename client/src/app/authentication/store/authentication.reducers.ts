import * as AuthenticationActions from './authentication.actions';

export interface State {
  email: string;
  firstName: string;
  lastName: string;
  token: string;
  client: string;
  expiry: string;
  uid: string;
  authenticated: boolean;
}

const initialState: State = {
  email: null,
  firstName: null,
  lastName: null,
  token: null,
  client: null,
  expiry: null,
  uid: null,
  authenticated: false
};

export function authReducer(state = initialState, action: AuthenticationActions.AuthenticationActions) {
  switch (action.type) {
    case (AuthenticationActions.SIGNIN):
      return {
        ...state,
        ...action.payload,
        authenticated: true,
      };
    case (AuthenticationActions.LOGOUT):
      return { ...initialState };
    case (AuthenticationActions.SET_AUTHENTICATION_INFO):
      return {
        ...state,
        ...action.payload
      };
    default:
      return state;
  }
}
