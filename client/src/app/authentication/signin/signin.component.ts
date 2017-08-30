import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Store } from '@ngrx/store';
import { MdSnackBar } from '@angular/material';

import * as fromApp from '../../store/app.reducers';
import * as AuthenticationActions from '../store/authentication.actions';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.css']
})
export class SigninComponent implements OnInit {
  form: FormGroup;
  isLoading = false;

  constructor(private formBuilder: FormBuilder,
              private store: Store<fromApp.AppState>,
              private snackBar: MdSnackBar) {
  }

  ngOnInit() {
    this.form = this.formBuilder.group({
      email: [null, [Validators.required, Validators.email]],
      password: [null, [Validators.required]]
    });
  }

  onSubmit() {
    const email = this.form.value['email'];
    const password = this.form.value['password'];

    this.store.dispatch(new AuthenticationActions.TrySignin({ email, password }));
  }

}
