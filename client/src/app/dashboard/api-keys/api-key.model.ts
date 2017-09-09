export class ApiKey {
  public id: number;
  public name: string;
  public token: string;
  public can_view_bookings: boolean;
  public can_edit_bookings: boolean;

  constructor(id: number, name: string, token: string, can_view_bookings: boolean, can_edit_bookings: boolean) {
    this.id = id;
    this.name = name;
    this.token = token;
    this.can_view_bookings = can_view_bookings;
    this.can_edit_bookings = can_edit_bookings;
  }
}
