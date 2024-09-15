// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  late String _name;
  late String _email;

  String get name => _name;
  String get email => _email;

  User(this._name, this._email);

  @override
  String toString() {
    return 'User: $_name, Email: $_email';
  }
}

class Ticket {
  late double _price;
  late DateTime dateTime;
  late String _description;

  Ticket(
    this._price,
    this.dateTime,
    this._description,
  );

  get price => this._price;
  get getDateTime => this.dateTime;
  get description => this._description;

  @override
  String toString() {
    return 'Ticket: \$${_price}, Date: ${dateTime.toLocal()}, Description: $_description';
  }
}

class Booking {
  User _user;
  List<Ticket> _tickets = [];

  Booking(this._user);

  get user => this._user;
  List<Ticket> get tickets => _tickets;

  void addTicket(Ticket ticket) {
    _tickets.add(ticket);
    print('Ticket added: ${ticket.description}');
  }

  void showBookingDetails() {
    print('Booking for user: ${_user.name}');
    if (_tickets.isEmpty) {
      print('No tickets booked yet.');
    } else {
      for (var ticket in _tickets) {
        print(ticket);
      }
    }
  }
}

class Cinema {
  List<User> _users = [];
  List<Booking> _bookings = [];

  void addUser(User user) {
    _users.add(user);
    print('User added: ${user.name}');
  }

  Booking createBooking(User user) {
    var booking = Booking(user);
    _bookings.add(booking);
    return booking;
  }

  void showAllBookings() {
    if (_bookings.isEmpty) {
      print('No bookings available.');
    } else {
      for (var booking in _bookings) {
        booking.showBookingDetails();
      }
    }
  }
}

void main() {
  Cinema cinema = Cinema();

  User user1 = User('John Doe', 'johndoe@example.com');
  User user2 = User('Jane Smith', 'janesmith@example.com');

  cinema.addUser(user1);
  cinema.addUser(user2);

  Booking booking1 = cinema.createBooking(user1);
  Ticket ticket1 = Ticket(12.50, DateTime.now(), 'Movie A');
  Ticket ticket2 =
      Ticket(15.00, DateTime.now().add(Duration(days: 1)), 'Movie B');

  booking1.addTicket(ticket1);
  booking1.addTicket(ticket2);

  cinema.showAllBookings();
}
