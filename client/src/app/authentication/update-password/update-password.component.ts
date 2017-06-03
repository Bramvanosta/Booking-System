import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Angular2TokenService } from 'angular2-token';
import { MdSnackBar } from '@angular/material';

@Component({
  selector: 'app-update-password',
  templateUrl: './update-password.component.html',
  styleUrls: ['./update-password.component.css']
})
export class UpdatePasswordComponent implements OnInit {
  form: FormGroup;
  isLoading: boolean = false;

  constructor(private formBuilder: FormBuilder,
              private authenticationService: Angular2TokenService,
              private snackBar: MdSnackBar,
              private route: ActivatedRoute,
              private router: Router) { }

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
    this.isLoading = true;

    this.authenticationService.updatePassword(
      {
        password: password,
        passwordConfirmation: passwordConfirmation,
        passwordCurrent: null,
        resetPasswordToken: resetPasswordToken
      })
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
