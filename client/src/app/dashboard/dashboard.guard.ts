import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';

import { State, Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/take';
import 'rxjs/add/operator/filter';
import 'rxjs/add/operator/switchMap';

import * as fromApp from '../store/app.reducers';
import * as fromCampgrounds from '../dashboard/campgrounds/store/campgrounds.reducers';
import * as CampgroundsActions from './campgrounds/store/campgrounds.actions';

@Injectable()
export class DashboardGuard implements CanActivate {

  constructor(private store: Store<fromApp.AppState>) {
  }

  waitForDataToLoad(): Observable<any> {
    return this.store.select('campgrounds')
      .filter((campgroundsState: fromCampgrounds.State) => !campgroundsState.loading)
      .take(1);
  }

  canActivate(): Observable<boolean> {
    return this.store.select('campgrounds')
      .take(1)
      .mergeMap((campgroundsState: fromCampgrounds.State) => {
        if (!campgroundsState.campgrounds.length) {
          this.store.dispatch(new CampgroundsActions.FetchCampgrounds());
          return this.waitForDataToLoad()
            .switchMap(() => {
              return Observable.of(true);
            });
        } else {
          return Observable.of(true);
        }
      });
  }
}
