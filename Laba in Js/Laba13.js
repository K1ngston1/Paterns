// Flyweight Pattern

class MovieTicket {
  constructor(movieTitle, showTime) {
    this.movieTitle = movieTitle;
    this.showTime = showTime;
  }

  static fromTicket(sharedState) {
    return new MovieTicket(sharedState.movieTitle, sharedState.showTime);
  }

  toString() {
    return `(${this.movieTitle}, ${this.showTime})`;
  }

  equals(other) {
    return (
      this.movieTitle === other.movieTitle && this.showTime === other.showTime
    );
  }
}

class TicketFlyWeightFactory {
  constructor() {
    this.flyweights = [];
  }

  getFlyWeight(sharedState) {
    let state = this.flyweights.find((element) => sharedState.equals(element));

    if (!state) {
      state = sharedState;
      this.flyweights.push(sharedState);
    }

    return state;
  }

  get total() {
    return this.flyweights.length;
  }
}

// Proxy Pattern

class IBooking {
  makeBooking(bookingID, sharedState) {
    throw new Error("Method 'makeBooking()' must be implemented.");
  }
}

class BookingMaker extends IBooking {
  constructor(flyWeightFactory) {
    super();
    this.flyWeightFactory = flyWeightFactory;
  }

  makeBooking(bookingID, sharedState) {
    const flyWeight = this.flyWeightFactory.getFlyWeight(sharedState);
    return new BookingContext(bookingID, flyWeight);
  }
}

class ProxyBookingMaker extends IBooking {
  constructor(subject) {
    super();
    this.subject = subject;
  }

  makeBooking(bookingID, sharedState) {
    this._logging(bookingID, sharedState);
    return this.subject.makeBooking(bookingID, sharedState);
  }

  _logging(bookingID, sharedState) {
    console.log(
      `Logging -> Booking ID: ${bookingID} || Ticket: ${sharedState}`
    );
  }
}

class BookingContext {
  constructor(bookingID, sharedState) {
    this.bookingID = bookingID;
    this.sharedState = sharedState;
  }

  toString() {
    return `Booking ID: ${this.bookingID} || Ticket: ${this.sharedState}`;
  }
}

// Example usage

function main() {
  const flyweightFactory = new TicketFlyWeightFactory();
  const bookingMaker = new BookingMaker(flyweightFactory);
  const proxyBookingMaker = new ProxyBookingMaker(bookingMaker);

  const sharedTicket1 = new MovieTicket("Avengers", "7:00 PM");
  const sharedTicket2 = new MovieTicket("Avengers", "7:00 PM");

  const booking1 = proxyBookingMaker.makeBooking("Booking1", sharedTicket1);
  const booking2 = proxyBookingMaker.makeBooking("Booking2", sharedTicket2);

  console.log(booking1.toString());
  console.log(booking2.toString());

  console.log(`Total unique tickets: ${flyweightFactory.total}`);
}

main();
