export class Season {
  public id: number;
  public name: string;
  public start_date: string;
  public end_date: string;

  constructor(id: number, name: string, start_date: string, end_date: string) {
    this.id = id;
    this.name = name;
    this.start_date = start_date;
    this.end_date = end_date;
  }
}
