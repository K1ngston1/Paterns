class MovieTicket {
  constructor(movieTitle, showTime) {
    this.movieTitle = movieTitle;
    this.showTime = showTime;
  }

  static fromTicket(ticket) {
    return new MovieTicket(ticket.movieTitle, ticket.showTime);
  }

  toString() {
    return `(${this.movieTitle}, ${this.showTime})`;
  }

  equals(ticket) {
    return (
      ticket instanceof MovieTicket &&
      this.movieTitle === ticket.movieTitle &&
      this.showTime === ticket.showTime
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

class CinemaOrderMarket {
  constructor(uniqueState, sharedState) {
    this.uniqueState = uniqueState;
    this.sharedState = sharedState;
  }

  static makeCinemaOrder(uniqueState, sharedState, factory) {
    const flyweight = factory.getFlyWeight(sharedState);
    return new CinemaOrderMarket(uniqueState, flyweight);
  }

  toString() {
    return `Order for ${this.uniqueState} with ticket: ${this.sharedState}`;
  }
}

// Main function
function main() {
  const flyweightFactory = new TicketFlyWeightFactory();

  // Create unique movie tickets with the same shared states
  const ticket1 = new MovieTicket("Avengers", "18:00");
  const ticket2 = new MovieTicket("Avengers", "18:00");
  const ticket3 = new MovieTicket("Inception", "20:00");

  const order1 = CinemaOrderMarket.makeCinemaOrder(
    "Order001",
    ticket1,
    flyweightFactory
  );
  const order2 = CinemaOrderMarket.makeCinemaOrder(
    "Order002",
    ticket2,
    flyweightFactory
  );
  const order3 = CinemaOrderMarket.makeCinemaOrder(
    "Order003",
    ticket3,
    flyweightFactory
  );

  console.log(order1.toString());
  console.log(order2.toString());
  console.log(order3.toString());

  // Show the total number of unique flyweights
  console.log(`Total unique tickets: ${flyweightFactory.total}`);
}

main();
