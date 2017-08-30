import { Injectable } from '@angular/core';
import {
  HttpErrorResponse,
  HttpEvent,
  HttpHandler,
  HttpInterceptor,
  HttpRequest,
  HttpResponse
} from '@angular/common/http';
import { Router } from '@angular/router';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/do';

import * as fromApp from '../store/app.reducers';
import * as AuthenticationActions from '../authentication/store/authentication.actions';

@Injectable()
export class AuthenticationInterceptor implements HttpInterceptor {
  constructor(private router: Router, private store: Store<fromApp.AppState>) {
  }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    return next.handle(request)
      .do((event: HttpEvent<any>) => {
        if (event instanceof HttpResponse) {
          const token = event.headers.get('access-token');
          const client = event.headers.get('client');
          const expiry = event.headers.get('expiry');
          const uid = event.headers.get('uid');
          localStorage.setItem('access-token', token);
          localStorage.setItem('client', client);
          localStorage.setItem('expiry', expiry);
          localStorage.setItem('uid', uid);
          this.store.dispatch(new AuthenticationActions.SetAuthenticationInfo({ token, client, expiry, uid }));
        }
      }, (error) => {
        if (error instanceof HttpErrorResponse) {
          if (error.status === 401) {
            this.store.dispatch(new AuthenticationActions.Logout());
            this.router.navigate(['/login']);
          }
        }
      })
  }
}
