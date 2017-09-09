import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/take';

import * as fromApp from '../../store/app.reducers';
import * as fromApiKeys from './store/api-key.reducers';
import * as ApiKeysActions from './store/api-key.actions';

@Injectable()
export class ApiKeysGuard implements CanActivate {

  constructor(private store: Store<fromApp.AppState>) {
  }

  canActivate(): Observable<boolean> {
    return this.store.select('apiKeys')
      .take(1)
      .mergeMap((apiKeysState: fromApiKeys.State) => {
        if (!apiKeysState.apiKeys.length) {
          this.store.dispatch(new ApiKeysActions.FetchApiKeys());
        }
        return Observable.of(true);
      });
  }
}
