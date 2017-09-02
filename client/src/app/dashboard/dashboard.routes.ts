import { Routes } from '@angular/router';

import { AuthenticationGuard } from '../shared/authentication.guard';
import { DashboardGuard } from './dashboard.guard';
import { BookingsGuard } from './bookings/bookings.guard';
import { ClientsGuard } from './clients/clients.guard';

import { DashboardComponent } from './dashboard.component';
import { HomeComponent } from './home/home.component';
import { BookingsComponent } from './bookings/bookings.component';
import { ClientsComponent } from './clients/clients.component';

export const dashboardRoutes: Routes = [
  {
    path: 'dashboard',
    component: DashboardComponent,
    canActivate: [AuthenticationGuard, DashboardGuard],
    children: [
      { path: '', component: HomeComponent },
      { path: 'bookings', component: BookingsComponent, canActivate: [BookingsGuard] },
      { path: 'clients', component: ClientsComponent, canActivate: [ClientsGuard] }
    ]
  }
];
