import { Injectable } from '@angular/core';
import { Actions, Effect } from '@ngrx/effects';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/switchMap';
import 'rxjs/add/operator/mergeMap';

import * as AuthenticationActions from './authentication.actions';

import { AuthenticationService } from '../authentication.service';

@Injectable()
export class AuthenticationEffects {

  @Effect({dispatch: false})
  authenticationSignin = this.actions$
    .ofType(AuthenticationActions.TRY_SIGNIN)
    .map((action: AuthenticationActions.TrySignin) => {
        return action.payload;
    })
    .switchMap((authenticationData: {email: string, password: string}) => {
        return this.authenticationService.signIn(authenticationData.email, authenticationData.password);
    })
    .do((data) => {
        console.log(data);
    });
    
    constructor(private actions$: Actions,
                private authenticationService: AuthenticationService) {
    }
}
