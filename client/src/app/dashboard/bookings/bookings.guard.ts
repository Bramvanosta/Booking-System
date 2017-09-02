import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/take';

import * as fromApp from '../../store/app.reducers';
import * as fromBookings from './store/bookings.reducers';
import * as BookingsActions from './store/bookings.actions';

@Injectable()
export class BookingsGuard implements CanActivate {

  constructor(private store: Store<fromApp.AppState>) {
  }

  canActivate(): Observable<boolean> {
    console.log('test');
    return this.store.select('bookings')
      .take(1)
      .mergeMap((bookingsState: fromBookings.State) => {
        if (!bookingsState.bookings.length) {
          this.store.dispatch(new BookingsActions.FetchBookings());
        }
        return Observable.of(true);
      });
  }
}
