import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MdSnackBar } from '@angular/material';
import { Angular2TokenService } from 'angular2-token';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.css']
})
export class SigninComponent implements OnInit {
  form: FormGroup;
  isLoading: boolean = false;
  serverError: string = '';

  constructor(private formBuilder: FormBuilder,
              private authenticationService: Angular2TokenService,
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
    this.isLoading = true;

    this.authenticationService.signIn({ email: email, password: password })
      .finally(() => this.isLoading = false)
      .subscribe(
        (result) => {
          console.log(result.json());
          console.log(this.authenticationService.currentUserData);
        },
        (error) => {
          this.serverError = error.json().errors[0];
          this.snackBar.open(this.serverError, 'hide', {duration: 5000});
        }
      )
  }

}
