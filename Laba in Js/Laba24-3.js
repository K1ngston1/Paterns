class Ticket {
  constructor(movieName, showtime, price) {
    this.movieName = movieName;
    this.showtime = showtime;
    this.price = price;
  }
}

class Booking {
  constructor(ticket, quantity) {
    this.ticket = ticket;
    this.quantity = quantity;
  }

  getTotal() {
    return this.ticket.price * this.quantity;
  }
}

class BookingService {
  constructor() {
    this.availableTickets = [];
    this.bookings = [];
  }

  addTicket(ticket) {
    this.availableTickets.push(ticket);
  }

  makeBooking(ticket, quantity) {
    if (this.availableTickets.includes(ticket)) {
      this.bookings.push(new Booking(ticket, quantity));
    } else {
      console.log("Ticket not available");
    }
  }

  calculateTotalSales() {
    return this.bookings.reduce(
      (total, booking) => total + booking.getTotal(),
      0
    );
  }
}

// Usage example
const bookingService = new BookingService();

const avengersTicket = new Ticket("Avengers", "2024-09-15 19:00", 12.0);
const spidermanTicket = new Ticket("Spiderman", "2024-09-16 21:00", 10.0);

bookingService.addTicket(avengersTicket);
bookingService.addTicket(spidermanTicket);

bookingService.makeBooking(avengersTicket, 2);
bookingService.makeBooking(spidermanTicket, 3);

console.log(`Total sales: $${bookingService.calculateTotalSales()}`);
