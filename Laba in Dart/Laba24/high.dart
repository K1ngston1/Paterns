abstract class ITicket {
  String get movieName;
  String get showtime;
  double get price;
}

class Ticket implements ITicket {
  @override
  final String movieName;
  @override
  final String showtime;
  @override
  final double price;

  Ticket(this.movieName, this.showtime, this.price);
}

abstract class IBooking {
  ITicket get ticket;
  int get quantity;
  double getTotal();
}

class Booking implements IBooking {
  @override
  final ITicket ticket;
  @override
  final int quantity;

  Booking(this.ticket, this.quantity);

  @override
  double getTotal() {
    return ticket.price * quantity;
  }
}

abstract class IBookingService {
  void addTicket(ITicket ticket);
  void makeBooking(ITicket ticket, int quantity);
  double calculateTotalSales();
}

class BookingService implements IBookingService {
  final List<ITicket> _availableTickets = [];
  final List<IBooking> _bookings = [];

  @override
  void addTicket(ITicket ticket) {
    _availableTickets.add(ticket);
  }

  @override
  void makeBooking(ITicket ticket, int quantity) {
    if (_availableTickets.contains(ticket)) {
      _bookings.add(Booking(ticket, quantity));
    } else {
      print('Квиток недоступний');
    }
  }

  @override
  double calculateTotalSales() {
    double total = 0;
    for (var booking in _bookings) {
      total += booking.getTotal();
    }
    return total;
  }
}

void main() {
  var bookingService = BookingService();
  var avengersTicket = Ticket('Avengers', '2024-09-15 19:00', 12.0);
  var spidermanTicket = Ticket('Spiderman', '2024-09-16 21:00', 10.0);

  bookingService.addTicket(avengersTicket);
  bookingService.addTicket(spidermanTicket);

  bookingService.makeBooking(avengersTicket, 2);
  bookingService.makeBooking(spidermanTicket, 3);

  print('Загальний дохід: \$${bookingService.calculateTotalSales()}');
}
