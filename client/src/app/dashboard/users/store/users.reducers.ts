import { User } from '../user.model';

import * as UsersActions from './users.actions';

export interface State {
  users: User[];
}

const initialState: State = {
  users: []
};

export function usersReducer(state = initialState, action: UsersActions.UsersActions) {
  switch (action.type) {
    case (UsersActions.SET_USERS):
      return {
        ...state,
        users: action.payload
      };
    case (UsersActions.ON_USERS_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
