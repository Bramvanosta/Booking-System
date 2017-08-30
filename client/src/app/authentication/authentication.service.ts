import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams, HttpRequest } from '@angular/common/http';

@Injectable()
export class AuthenticationService {
    constructor(private httpClient: HttpClient) {}

    signIn(email: string, password: string) {
        return this.httpClient.post('http://api.booking-system.dev/v1/auth/sign_in', {email, password})
    }
}
