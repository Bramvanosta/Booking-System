import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/take';

import * as fromApp from '../../store/app.reducers';
import * as fromClients from './store/clients.reducers';
import * as ClientsActions from './store/clients.actions';

@Injectable()
export class ClientsGuard implements CanActivate {

  constructor(private store: Store<fromApp.AppState>) {
  }

  canActivate(): Observable<boolean> {
    return this.store.select('clients')
      .take(1)
      .mergeMap((clientsState: fromClients.State) => {
        if (!clientsState.clients.length) {
          this.store.dispatch(new ClientsActions.FetchClients());
        }
        return Observable.of(true);
      });
  }
}
