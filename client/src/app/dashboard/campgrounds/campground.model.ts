export class Campground {
  public id: number;
  public name: string;
  public logo_url: string;

  constructor(id: number, name: string, logo_url: string) {
    this.id = id;
    this.name = name;
    this.logo_url = logo_url;
  }
}
