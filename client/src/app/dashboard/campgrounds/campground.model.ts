import { Rights } from "./rights.model";

export class Campground {
  public id: number;
  public name: string;
  public logo_url: string;
  public rights: Rights;

  constructor(id: number, name: string, logo_url: string, rights?: Rights) {
    this.id = id;
    this.name = name;
    this.logo_url = logo_url;
    this.rights = rights;
  }
}
