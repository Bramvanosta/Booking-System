import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.css']
})
export class SigninComponent implements OnInit {
  form: FormGroup;
  isLoading = false;

  constructor(private formBuilder: FormBuilder) {
  }

  ngOnInit() {
    this.form = this.formBuilder.group({
      email: [{ value: null, disabled: this.isLoading }, [Validators.required]],
      password: [{ value: null, disabled: this.isLoading }, [Validators.required]]
    });
  }

  onSubmit() {
    const email = this.form.value['email'];
    const password = this.form.value['password'];

    this.isLoading = !this.isLoading;
    //
    // setTimeout(() => {
    //   this.isLoading = false;
    // }, 1500);
  }

}
