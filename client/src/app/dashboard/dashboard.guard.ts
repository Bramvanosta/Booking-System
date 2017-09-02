import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/take';

import * as fromApp from '../store/app.reducers';
import * as fromCampgrounds from '../dashboard/campgrounds/store/campgrounds.reducers';
import * as CampgroundsActions from './campgrounds/store/campgrounds.actions';

@Injectable()
export class DashboardGuard implements CanActivate {

  constructor(private store: Store<fromApp.AppState>) {
  }

  canActivate(): Observable<boolean> {
    return this.store.select('campgrounds')
      .take(1)
      .mergeMap((campgroundsState: fromCampgrounds.State) => {
        if (!campgroundsState.campgrounds.length) {
          this.store.dispatch(new CampgroundsActions.FetchCampgrounds());
        }
        return Observable.of(true);
      });
  }
}
