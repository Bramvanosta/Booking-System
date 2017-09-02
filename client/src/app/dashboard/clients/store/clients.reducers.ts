import { Client } from '../client.model';

import * as ClientsActions from './clients.actions';

export interface State {
  clients: Client[];
}

const initialState: State = {
  clients: []
};

export function clientsReducer(state = initialState, action: ClientsActions.ClientsActions) {
  switch (action.type) {
    case (ClientsActions.SET_CLIENTS):
      return {
        ...state,
        clients: action.payload
      };
    case (ClientsActions.ON_CLIENTS_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
