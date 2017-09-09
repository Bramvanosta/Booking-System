import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/take';

import * as fromApp from '../../store/app.reducers';
import * as fromUsers from './store/users.reducers';
import * as UsersActions from './store/users.actions';

@Injectable()
export class UsersGuard implements CanActivate {

  constructor(private store: Store<fromApp.AppState>) {
  }

  canActivate(): Observable<boolean> {
    return this.store.select('users')
      .take(1)
      .mergeMap((usersState: fromUsers.State) => {
        if (!usersState.users.length) {
          this.store.dispatch(new UsersActions.FetchUsers());
        }
        return Observable.of(true);
      });
  }
}
