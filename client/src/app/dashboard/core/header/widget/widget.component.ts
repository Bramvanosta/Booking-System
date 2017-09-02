import { Component, OnInit } from '@angular/core';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';

import * as fromApp from '../../../../store/app.reducers';
import * as AuthenticationActions from '../../../../authentication/store/authentication.actions';

@Component({
  selector: 'app-header-widget',
  templateUrl: './widget.component.html',
  styleUrls: ['./widget.component.css']
})
export class HeaderWidgetComponent implements OnInit {
  authenticationState: Observable<any>;

  constructor(private store: Store<fromApp.AppState>) {
  }

  ngOnInit() {
    this.authenticationState = this.store.select('authentication');
  }

  onLogout() {
    this.store.dispatch(new AuthenticationActions.Logout());
  }

}
