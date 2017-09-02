import { ActionReducerMap } from '@ngrx/store';

import * as fromAuthentication from '../authentication/store/authentication.reducers';

export interface AppState {
  authentication: fromAuthentication.State;
}

export const reducers: ActionReducerMap<AppState> = {
  authentication: fromAuthentication.authReducer
};
