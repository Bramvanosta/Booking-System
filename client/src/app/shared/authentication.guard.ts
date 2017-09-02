import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/take';

import * as fromApp from '../store/app.reducers';
import * as fromAuthentication from '../authentication/store/authentication.reducers';

@Injectable()
export class AuthenticationGuard implements CanActivate {

  constructor(private router: Router,
              private store: Store<fromApp.AppState>) {
  }

  canActivate(): Observable<boolean> {
    return this.store.select('authentication')
      .take(1)
      .map((authenticationState: fromAuthentication.State) => {
        if (!authenticationState.authenticated) {
          this.router.navigate(['/']);
        }
        return authenticationState.authenticated;
      });
  }
}
