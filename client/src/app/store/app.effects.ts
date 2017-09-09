import { AuthenticationEffects } from '../authentication/store/authentication.effects';
import { CampgroundsEffects } from '../dashboard/campgrounds/store/campgrounds.effects';
import { BookingsEffects } from '../dashboard/bookings/store/bookings.effects';
import { ClientsEffects } from '../dashboard/clients/store/clients.effects';
import { RightsEffects } from '../dashboard/rights/store/rights.effects';

export const effects = [
  AuthenticationEffects,
  CampgroundsEffects,
  BookingsEffects,
  ClientsEffects,
  RightsEffects
];
