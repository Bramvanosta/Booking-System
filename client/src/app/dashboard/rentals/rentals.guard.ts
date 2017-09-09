import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/take';

import * as fromApp from '../../store/app.reducers';
import * as fromRentals from './store/rentals.reducers';
import * as RentalsActions from './store/rentals.actions';

@Injectable()
export class RentalsGuard implements CanActivate {

  constructor(private store: Store<fromApp.AppState>) {
  }

  canActivate(): Observable<boolean> {
    return this.store.select('rentals')
      .take(1)
      .mergeMap((rentalsState: fromRentals.State) => {
        if (!rentalsState.rentalCategories.length) {
          this.store.dispatch(new RentalsActions.FetchRentalCategories());
        }
        return Observable.of(true);
      });
  }
}
