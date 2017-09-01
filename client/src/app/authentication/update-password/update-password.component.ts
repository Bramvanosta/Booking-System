import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';

import { Store } from '@ngrx/store';

import * as fromApp from '../../store/app.reducers';
import * as AuthenticationActions from '../store/authentication.actions';

@Component({
  selector: 'app-update-password',
  templateUrl: './update-password.component.html',
  styleUrls: ['./update-password.component.css']
})
export class UpdatePasswordComponent implements OnInit {
  form: FormGroup;

  constructor(private formBuilder: FormBuilder,
              private route: ActivatedRoute,
              private store: Store<fromApp.AppState>) { }

  ngOnInit() {
    this.form = this.formBuilder.group({
      password: [null, [Validators.required]],
      passwordConfirmation: [null, [Validators.required]]
    });
  }

  onSubmit() {
    const password = this.form.value['password'];
    const passwordConfirmation = this.form.value['passwordConfirmation'];
    const resetPasswordToken = this.route.snapshot.params['token'];

    this.store.dispatch(new AuthenticationActions.TryUpdatePassword({password, passwordConfirmation, resetPasswordToken}));
  }

}
