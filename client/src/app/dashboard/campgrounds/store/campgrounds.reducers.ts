import { Campground } from '../campground.model';

import * as CampgroundsActions from './campgrounds.actions';

export interface State {
  campgrounds: Campground[];
  currentCampground: Campground;
  loading: boolean;
}

const initialState: State = {
  campgrounds: [],
  currentCampground: null,
  loading: false
};

export function campgroundsReducer(state = initialState, action: CampgroundsActions.CampgroundsActions) {
  switch (action.type) {
    case (CampgroundsActions.FETCH_CAMPGROUNDS):
      return {
        ...state,
        loading: true
      };
    case (CampgroundsActions.SET_CAMPGROUNDS):
      return {
        ...state,
        campgrounds: action.payload
      };
    case (CampgroundsActions.SET_CURRENT_CAMPGROUND):
      const currentCampground = state.campgrounds.find((campground) => campground.id === action.payload);
      return {
        ...state,
        currentCampground: currentCampground,
        loading: false
      };
    case (CampgroundsActions.ON_CAMPGROUNDS_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
