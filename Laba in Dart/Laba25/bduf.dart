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

void main() {
  User user = User('John Doe', 'johndoe@example.com');
  Ticket ticket1 = Ticket(12.50, DateTime.now(), 'Movie A');
  Ticket ticket2 =
      Ticket(15.00, DateTime.now().add(Duration(days: 1)), 'Movie B');
  Booking booking = Booking(user);
  booking.addTicket(ticket1);
  booking.addTicket(ticket2);
  booking.showBookingDetails();
}
