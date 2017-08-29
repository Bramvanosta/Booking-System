import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MdSnackBar } from '@angular/material';
import { Angular2TokenService } from 'angular2-token';
import { Router } from '@angular/router';
import 'rxjs/add/operator/finally';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.css']
})
export class ResetPasswordComponent implements OnInit {
  form: FormGroup;
  isLoading: boolean = false;

  constructor(private formBuilder: FormBuilder,
              private authenticationService: Angular2TokenService,
              private snackBar: MdSnackBar,
              private router: Router) {
  }

  ngOnInit() {
    this.form = this.formBuilder.group({
      email: [null, [Validators.required, Validators.email]]
    });
  }

  onSubmit() {
    const email = this.form.value['email'];
    this.isLoading = true;

    this.authenticationService.resetPassword({ email: email })
      .finally(() => this.isLoading = false)
      .subscribe(
        (result) => {
          console.log(result.json()); // TODO Remove this log
          const validationMessage = result.json().message;
          this.snackBar.open(validationMessage, 'hide', {duration: 6000});
          this.router.navigate(['/login']);
        },
        (error) => {
          const errorMessage = error.json().errors[0];
          this.snackBar.open(errorMessage, 'hide', {duration: 6000});
        }
      )
  }

}
