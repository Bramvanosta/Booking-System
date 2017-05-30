import { BookingSystemPage } from './app.po';

describe('booking-system App', () => {
  let page: BookingSystemPage;

  beforeEach(() => {
    page = new BookingSystemPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
