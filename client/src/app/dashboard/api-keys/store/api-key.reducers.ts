import { ApiKey } from '../api-key.model';

import * as ApiKeysActions from './api-key.actions';

export interface State {
  apiKeys: ApiKey[];
}

const initialState: State = {
  apiKeys: []
};

export function apiKeysReducer(state = initialState, action: ApiKeysActions.ApiKeysActions) {
  switch (action.type) {
    case (ApiKeysActions.SET_API_KEYS):
      return {
        ...state,
        apiKeys: action.payload
      };
    case (ApiKeysActions.ON_API_KEYS_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
