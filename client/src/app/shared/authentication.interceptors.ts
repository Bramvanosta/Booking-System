import {Injectable} from '@angular/core';
import {
  HttpErrorResponse,
  HttpEvent,
  HttpHandler,
  HttpInterceptor,
  HttpRequest,
  HttpResponse
} from '@angular/common/http';

import {Store} from '@ngrx/store';

import {Observable} from 'rxjs/Observable';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/take';
import 'rxjs/add/operator/mergeMap';

import {environment} from '../../environments/environment';

import * as fromApp from '../store/app.reducers';
import * as fromAuthentication from '../authentication/store/authentication.reducers';
import * as AuthenticationActions from '../authentication/store/authentication.actions';

@Injectable()
export class AuthenticationInterceptor implements HttpInterceptor {
  apiUrl = environment.environmentName === 'development' ? 'http://api.booking-system.dev/v1/' : 'https://api.booking-system.bramvanosta.com/v1/';

  constructor(private store: Store<fromApp.AppState>) {
  }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    return this.store.select('authentication')
      .take(1)
      .mergeMap((authenticationState: fromAuthentication.State) => {
        let copiedRequest;
        if (authenticationState.token && authenticationState.client && authenticationState.uid && authenticationState.expiry) {
          copiedRequest = request.clone({
            setHeaders: {
              'access-token': authenticationState.token,
              'client': authenticationState.client,
              'uid': authenticationState.uid,
              'expiry': authenticationState.expiry,
              'token-type': 'Bearer'
            },
            url: 'http://api.booking-system.dev/v1/' + request.url
          });
        } else {
          copiedRequest = request.clone({url: this.apiUrl + request.url});
        }
        return next.handle(copiedRequest)
          .do((event: HttpEvent<any>) => {
            if (event instanceof HttpResponse) {
              const token = event.headers.get('access-token');
              const client = event.headers.get('client');
              const expiry = event.headers.get('expiry');
              const uid = event.headers.get('uid');
              if (token && client && expiry && uid) {
                this.store.dispatch(new AuthenticationActions.SetAuthenticationInfo({token, client, expiry, uid}));
              }
            }
          }, (error) => {
            if (error instanceof HttpErrorResponse) {
              if (error.status === 401) {
                this.store.dispatch(new AuthenticationActions.Logout());
              }
            }
          })
      })
  }
}
