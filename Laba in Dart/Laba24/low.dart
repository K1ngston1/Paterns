class Movie {
  final String title;
  final String description;
  final DateTime showTime;

  Movie(this.title, this.description, this.showTime);
}

class Ticket {
  final Movie movie;
  final String seatNumber;

  Ticket(this.movie, this.seatNumber);
}

class Booking {
  final List<Ticket> _tickets = [];

  void addTicket(Ticket ticket) {
    _tickets.add(ticket);
  }

  List<Ticket> get tickets => List.unmodifiable(_tickets);

  double get totalAmount {
    const double ticketPrice = 10.0;
    return _tickets.length * ticketPrice;
  }
}

class PaymentProcessor {
  final Booking _booking;

  PaymentProcessor(this._booking);

  void processPayment() {
    final amount = _booking.totalAmount;
    print('Processing payment for amount: \$${amount.toStringAsFixed(2)}');
  }
}

void main() {
  final movie =
      Movie('The Matrix', 'A sci-fi classic', DateTime(2024, 10, 1, 19, 0));
  final ticket1 = Ticket(movie, 'A1');
  final ticket2 = Ticket(movie, 'A2');

  final booking = Booking();
  booking.addTicket(ticket1);
  booking.addTicket(ticket2);

  final paymentProcessor = PaymentProcessor(booking);
  paymentProcessor.processPayment();
}
