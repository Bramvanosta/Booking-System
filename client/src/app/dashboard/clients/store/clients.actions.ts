import { Action } from '@ngrx/store';

import { Client } from '../client.model';

export const FETCH_CLIENTS = 'FETCH_CLIENTS';
export const SET_CLIENTS = 'SET_CLIENTS';
export const ON_CLIENTS_ERROR = 'ON_CLIENTS_ERROR';

export class FetchClients implements Action {
  readonly type = FETCH_CLIENTS;
}

export class SetClients implements Action {
  readonly type = SET_CLIENTS;

  constructor(public payload: Client[]) {
  }
}

export class OnClientsError implements Action {
  readonly type = ON_CLIENTS_ERROR;

  constructor(public payload: string) {
  }
}

export type ClientsActions =
  FetchClients |
  SetClients |
  OnClientsError;
