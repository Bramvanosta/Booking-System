import * as AuthenticationActions from '../authentication/store/authentication.actions';

export function reset(reducer) {
  return function newReducer(state, action) {

    if (action.type === AuthenticationActions.LOGOUT) {
      state = undefined;
    }

    return reducer(state, action);
  }
}
