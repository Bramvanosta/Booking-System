import { Routes } from '@angular/router';

import { AuthenticationGuard } from '../shared/authentication.guard';

import { DashboardComponent } from './dashboard.component';
import { HomeComponent } from './home/home.component';
import { BookingsComponent } from './bookings/bookings.component';
import { ClientsComponent } from './clients/clients.component';

export const dashboardRoutes: Routes = [
  {
    path: 'dashboard',
    component: DashboardComponent,
    canActivate: [AuthenticationGuard],
    children: [
      { path: '', component: HomeComponent },
      { path: 'bookings', component: BookingsComponent },
      { path: 'clients', component: ClientsComponent }
    ]
  }
];
