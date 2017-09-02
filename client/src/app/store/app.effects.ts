import { AuthenticationEffects } from '../authentication/store/authentication.effects';
import { CampgroundsEffects } from '../dashboard/campgrounds/store/campgrounds.effects';
import { BookingsEffects } from '../dashboard/bookings/store/bookings.effects';

export const effects = [
  AuthenticationEffects,
  CampgroundsEffects,
  BookingsEffects
];
