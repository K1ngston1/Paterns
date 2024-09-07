// Інтерфейс Mediator
abstract class Mediator {
  void notify(Colleague sender, String event);
}

class TicketMediator implements Mediator {
  late TicketSales _ticketSales;
  late BookingSystem _bookingSystem;

  void setTicketSales(TicketSales ticketSales) {
    _ticketSales = ticketSales;
  }

  void setBookingSystem(BookingSystem bookingSystem) {
    _bookingSystem = bookingSystem;
  }

  @override
  void notify(Colleague sender, String event) {
    if (sender == _ticketSales) {
      print("Mediator reacts to TicketSales' event and updates BookingSystem.");
      _bookingSystem.updateAvailability();
    } else if (sender == _bookingSystem) {
      print(
          "Mediator reacts to BookingSystem's event and updates TicketSales.");
      _ticketSales.updateSales();
    }
  }
}

abstract class Colleague {
  Mediator mediator;

  Colleague(this.mediator);

  void doSomething();
}

class TicketSales extends Colleague {
  TicketSales(Mediator mediator) : super(mediator);

  @override
  void doSomething() {
    print("TicketSales handles a new sale.");
    mediator.notify(this, 'sale');
  }

  void updateSales() {
    print("TicketSales updates the sales data.");
  }
}

class BookingSystem extends Colleague {
  BookingSystem(Mediator mediator) : super(mediator);

  @override
  void doSomething() {
    print("BookingSystem processes a new booking.");
    mediator.notify(this, 'booking');
  }

  void updateAvailability() {
    print("BookingSystem updates ticket availability.");
  }
}

void main() {
  TicketMediator mediator = TicketMediator();

  TicketSales ticketSales = TicketSales(mediator);
  BookingSystem bookingSystem = BookingSystem(mediator);

  mediator.setTicketSales(ticketSales);
  mediator.setBookingSystem(bookingSystem);

  ticketSales.doSomething();
  bookingSystem.doSomething();
}
