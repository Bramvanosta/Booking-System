import * as AuthenticationActions from './authentication.actions';

export interface State {
  email: string;
  firstName: string;
  lastName: string;
  token: string;
  client: string;
  expiry: string;
  authenticated: boolean;
}

const initialState: State = {
  email: null,
  firstName: null,
  lastName: null,
  token: null,
  client: null,
  expiry: null,
  authenticated: false
};

export function authReducer(state = initialState, action: AuthenticationActions.AuthenticationActions) {
  switch (action.type) {
    case (AuthenticationActions.SIGNIN):
      return {
        ...state,
        authenticated: true,
      };
    case (AuthenticationActions.LOGOUT):
      return { ...initialState };
    default:
      return state;
  }
}
