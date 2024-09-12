class Ticket {
  constructor(movieTitle, showTime, price) {
    this.movieTitle = movieTitle;
    this.showTime = showTime;
    this.price = price;
  }

  printTicket() {
    // To be overridden by subclasses
    throw new Error("printTicket method must be overridden");
  }
}

class Booking {
  constructor(ticket, user) {
    this.ticket = ticket;
    this.user = user;
  }

  completeBooking() {
    Logger.log(
      `Booking successful for ${this.ticket.movieTitle} by user ${this.user}.`
    );
  }

  cancelBooking() {
    Logger.log(
      `Booking canceled for ${this.ticket.movieTitle} by user ${this.user}.`
    );
  }
}

// Pure Fabrication: Class for logging
class Logger {
  static log(message) {
    const timestamp = new Date().toISOString();
    console.log(`${timestamp}: ${message}`);
  }
}

// Implementation of the Ticket class
class MovieTicket extends Ticket {
  constructor(movieTitle, showTime, price) {
    super(movieTitle, showTime, price);
  }

  printTicket() {
    console.log(
      `Ticket for ${
        this.movieTitle
      } at ${this.showTime.toISOString()} - Price: $${this.price}`
    );
  }
}

// Example usage
const ticket = new MovieTicket("Inception", new Date(2024, 9, 1, 19, 30), 12.5);
const booking = new Booking(ticket, "John Doe");
booking.completeBooking();
booking.cancelBooking();
