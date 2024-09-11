abstract class Ticket {
  double getPrice();
  String getTicket();
  String gateDate();
}

class Booking implements Ticket {
  late String _ticket;
  late String _date;
  late double _price;

  Booking(String ticket, String date, double price) {
    this._ticket = ticket;
    this._date = date;
    this._price = price;
  }

  @override
  double getPrice() => _price;

  @override
  String getTicket() => _ticket;

  @override
  String gateDate() => _date;
}

class Cinema {
  late String _name;
  late List<Booking> _bookings;

  Cinema(String name) {
    _name = name;
    _bookings = [];
  }

  String get name => _name;

  void addBooking(Booking booking) {
    _bookings.add(booking);
  }

  void listBookings() {
    print('Bookings for $_name:');
    for (var booking in _bookings) {
      print('Ticket: ${booking.getTicket()}');
      print('Date: ${booking.gateDate()}');
      print('Price: \$${booking.getPrice()}');
      print('---');
    }
  }
}

void main() {
  Cinema cinema = Cinema('Grand Cinema');
  Booking booking1 = Booking('TICKET123', '2024-09-15', 12.50);
  Booking booking2 = Booking('TICKET456', '2024-09-16', 15.00);
  cinema.addBooking(booking1);
  cinema.addBooking(booking2);
  cinema.listBookings();
}
