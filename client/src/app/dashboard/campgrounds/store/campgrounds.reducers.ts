import { Campground } from '../campground.model';

import * as CampgroundsActions from './campgrounds.actions';

export interface State {
  campgrounds: Campground[];
  currentCampground: Campground;
}

const initialState: State = {
  campgrounds: [],
  currentCampground: null
};

export function campgroundsReducer(state = initialState, action: CampgroundsActions.CampgroundsActions) {
  switch (action.type) {
    case (CampgroundsActions.SET_CAMPGROUNDS):
      return {
        ...state,
        campgrounds: action.payload
      };
    case (CampgroundsActions.SET_CURRENT_CAMPGROUND):
      const currentCampground = state.campgrounds.find((campground) => campground.id === action.payload);
      return {
        ...state,
        currentCampground: currentCampground
      };
    case (CampgroundsActions.SET_RIGHTS):
      return {
        ...state,
        currentCampground: {
          ...state.currentCampground,
          rights: action.payload
        }
      };
    case (CampgroundsActions.ON_CAMPGROUNDS_ERROR):
      return { ...initialState };
    default:
      return state;
  }
}
