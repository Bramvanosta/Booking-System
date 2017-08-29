import * as AuthenticationActions from './authentication.actions';

export interface State {
  token: string;
  authenticated: boolean;
}

const initialState: State = {
  token: null,
  authenticated: false
};

export function authReducer(state = initialState, action: AuthenticationActions.AuthenticationActions) {
  switch (action.type) {
    case (AuthenticationActions.SIGNIN):
      return {
        ...state,
        authenticated: true
      };
    case (AuthenticationActions.LOGOUT):
      return {
        ...state,
        token: null,
        authenticated: false
      };
    default:
      return state;
  }
}
