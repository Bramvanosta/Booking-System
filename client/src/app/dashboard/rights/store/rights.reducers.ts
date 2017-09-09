import { Rights } from '../rights.model';

import * as RightsActions from './rights.actions';

export interface State {
  rights: Rights;
}

const initialState: State = {
  rights: null
};

export function rightsReducer(state = initialState, action: RightsActions.RightsActions) {
  switch (action.type) {
    case (RightsActions.SET_RIGHTS):
      return {
        ...state,
        rights: action.payload
      };
    case (RightsActions.ON_RIGHTS_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
