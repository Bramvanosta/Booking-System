import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { MdSnackBar } from '@angular/material';

import { Action, Store } from '@ngrx/store';
import { Actions, Effect, toPayload } from '@ngrx/effects';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/mergeMap';
import 'rxjs/add/operator/take';

import * as ClientsActions from './clients.actions';
import * as fromApp from '../../../store/app.reducers';
import * as fromCampgrounds from '../../campgrounds/store/campgrounds.reducers';

import { Client } from '../client.model';

@Injectable()
export class ClientsEffects {

  @Effect() fetchClients: Observable<Action> = this.actions$
    .ofType(ClientsActions.FETCH_CLIENTS)
    .mergeMap(() => {
      return this.store.select('campgrounds')
        .take(1)
        .mergeMap((campgroundsState: fromCampgrounds.State) => {
          return this.httpClient.get<Client[]>(`campgrounds/${campgroundsState.currentCampground.id}/clients`)
            .map((clients: Client[]) => {
              return {
                type: ClientsActions.SET_CLIENTS,
                payload: clients
              }
            })
            .catch((errorResponse: HttpErrorResponse) => {
              const errorMessage = errorResponse.error ? errorResponse.error.errors[0] : '';
              return Observable.of(new ClientsActions.OnClientsError(errorMessage));
            })
        })
    });

  @Effect({ dispatch: false }) onClientsError = this.actions$
    .ofType(ClientsActions.ON_CLIENTS_ERROR)
    .map(toPayload)
    .do((payload: string) => {
      this.snackBar.open(payload, 'hide', { duration: 6000 });
    });

  constructor(private actions$: Actions,
              private store: Store<fromApp.AppState>,
              private httpClient: HttpClient,
              private snackBar: MdSnackBar) {
  }
}
