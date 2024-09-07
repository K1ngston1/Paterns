// Інтерфейс Mediator
class Mediator {
  notify(sender, event) {}
}

class TicketMediator extends Mediator {
  constructor() {
    super();
    this.ticketSales = null;
    this.bookingSystem = null;
  }

  setTicketSales(ticketSales) {
    this.ticketSales = ticketSales;
  }

  setBookingSystem(bookingSystem) {
    this.bookingSystem = bookingSystem;
  }

  notify(sender, event) {
    if (sender === this.ticketSales) {
      console.log(
        "Mediator reacts to TicketSales' event and updates BookingSystem."
      );
      this.bookingSystem.updateAvailability();
    } else if (sender === this.bookingSystem) {
      console.log(
        "Mediator reacts to BookingSystem's event and updates TicketSales."
      );
      this.ticketSales.updateSales();
    }
  }
}

// Колеги
class Colleague {
  constructor(mediator) {
    this.mediator = mediator;
  }

  doSomething() {}
}

class TicketSales extends Colleague {
  constructor(mediator) {
    super(mediator);
  }

  doSomething() {
    console.log("TicketSales handles a new sale.");
    this.mediator.notify(this, "sale");
  }

  updateSales() {
    console.log("TicketSales updates the sales data.");
  }
}

class BookingSystem extends Colleague {
  constructor(mediator) {
    super(mediator);
  }

  doSomething() {
    console.log("BookingSystem processes a new booking.");
    this.mediator.notify(this, "booking");
  }

  updateAvailability() {
    console.log("BookingSystem updates ticket availability.");
  }
}

// Основна частина
function main() {
  const mediator = new TicketMediator();

  const ticketSales = new TicketSales(mediator);
  const bookingSystem = new BookingSystem(mediator);

  mediator.setTicketSales(ticketSales);
  mediator.setBookingSystem(bookingSystem);

  ticketSales.doSomething();
  bookingSystem.doSomething();
}

main();
