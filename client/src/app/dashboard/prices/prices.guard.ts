import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/take';

import * as fromApp from '../../store/app.reducers';
import * as fromPrices from './store/prices.reducers';
import * as PricesActions from './store/prices.actions';

@Injectable()
export class PricesGuard implements CanActivate {

  constructor(private store: Store<fromApp.AppState>) {
  }

  canActivate(): Observable<boolean> {
    return this.store.select('prices')
      .take(1)
      .mergeMap((pricesState: fromPrices.State) => {
        if (!pricesState.seasons.length) {
          this.store.dispatch(new PricesActions.FetchSeasons());
        }
        return Observable.of(true);
      });
  }
}
