import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { Observable } from 'rxjs/Observable';

import { Store } from '@ngrx/store';

import * as fromApp from '../../store/app.reducers';
import * as AuthenticationActions from '../store/authentication.actions';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.css']
})
export class ResetPasswordComponent implements OnInit {
  form: FormGroup;
  authenticationState: Observable<any>;

  constructor(private formBuilder: FormBuilder,
              private store: Store<fromApp.AppState>) {
  }

  ngOnInit() {
    this.authenticationState = this.store.select('authentication');

    this.form = this.formBuilder.group({
      email: [null, [Validators.required, Validators.email]]
    });
  }

  onSubmit() {
    const email = this.form.value['email'];

    this.store.dispatch(new AuthenticationActions.TryResetPassword(email));
  }

}
