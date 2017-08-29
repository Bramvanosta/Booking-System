import { ActionReducerMap } from '@ngrx/store';

import * as fromAuth from '../authentication/store/authentication.reducers';

export interface AppState {
  auth: fromAuth.State
}

export const reducers: ActionReducerMap<AppState> = {
  auth: fromAuth.authReducer
};
