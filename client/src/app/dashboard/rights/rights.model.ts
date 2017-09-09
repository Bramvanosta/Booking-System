export class Rights {
  public can_view_rights: boolean;
  public can_edit_rights: boolean;
  public can_view_campground: boolean;
  public can_edit_campground: boolean;
  public can_view_bookings: boolean;
  public can_edit_bookings: boolean;
  public can_create_bookings: boolean;
  public can_delete_bookings: boolean;
  public can_view_clients: boolean;
  public can_edit_clients: boolean;
  public can_delete_clients: boolean;
  public can_view_api_keys: boolean;
  public can_create_api_keys: boolean;
  public can_edit_api_keys: boolean;
  public can_delete_api_keys: boolean;
  public can_view_users: boolean;
  public can_create_users: boolean;
  public can_edit_users: boolean;
  public can_delete_users: boolean;

  constructor(can_view_rights: boolean,
              can_edit_rights: boolean,
              can_view_campground: boolean,
              can_edit_campground: boolean,
              can_view_bookings: boolean,
              can_edit_bookings: boolean,
              can_create_bookings: boolean,
              can_delete_bookings: boolean,
              can_view_clients: boolean,
              can_edit_clients: boolean,
              can_delete_clients: boolean,
              can_view_api_keys: boolean,
              can_create_api_keys: boolean,
              can_edit_api_keys: boolean,
              can_delete_api_keys: boolean,
              can_view_users: boolean,
              can_create_users: boolean,
              can_edit_users: boolean,
              can_delete_users: boolean) {
    this.can_view_rights = can_view_rights;
    this.can_edit_rights = can_edit_rights;
    this.can_view_campground = can_view_campground;
    this.can_edit_campground = can_edit_campground;
    this.can_view_bookings = can_view_bookings;
    this.can_edit_bookings = can_edit_bookings;
    this.can_create_bookings = can_create_bookings;
    this.can_delete_bookings = can_delete_bookings;
    this.can_view_clients = can_view_clients;
    this.can_edit_clients = can_edit_clients;
    this.can_delete_clients = can_delete_clients;
    this.can_view_api_keys = can_view_api_keys;
    this.can_create_api_keys = can_create_api_keys;
    this.can_edit_api_keys = can_edit_api_keys;
    this.can_delete_api_keys = can_delete_api_keys;
    this.can_view_users = can_view_users;
    this.can_create_users = can_create_users;
    this.can_edit_users = can_edit_users;
    this.can_delete_users = can_delete_users;
  }
}
