// ignore_for_file: public_member_api_docs, sort_constructors_first
class Client {
  late String _name;
  late String _email;

  Client(this._name, this._email);

  String get name => _name;
  String get email => _email;

  @override
  String toString() {
    return 'Client: $_name, Email: $_email';
  }
}

class Ticket {
  late String _name;
  late double _price;
  late DateTime dateTime;

  Ticket(
    this._name,
    this._price,
    this.dateTime,
  );

  String get name => _name;
  double get price => _price;

  @override
  String toString() {
    return 'Tour to $_name, Price: \$$_price, Start Date: ${dateTime.toLocal()}';
  }
}

class Cinema {
  late String _name;
  late String _location;
  List<Ticket> _tickets = [];

  Cinema(this._name, this._location);

  String get name => _name;
  String get location => _location;
  List<Ticket> get tickets => _tickets;

  void addTicket(Ticket ticket) {
    _tickets.add(ticket);
    print('Ticket added: ${ticket.name}');
  }

  void showAvailableTickets() {
    if (_tickets.isEmpty) {
      print('No tickets available.');
    } else {
      print('Available tickets:');
      for (var ticket in _tickets) {
        print(ticket);
      }
    }
  }

  @override
  String toString() {
    return 'Cinema: $_name, Location: $_location';
  }
}

class Booking {
  Client _client;
  Ticket _ticket;
  late DateTime bookingDate;

  Booking(this._client, this._ticket, this.bookingDate);

  Client get client => _client;
  Ticket get ticket => _ticket;

  @override
  String toString() {
    return 'Booking for ${_client.name}:\n'
        '${_ticket}\n'
        'Booking Date: ${bookingDate.toLocal()}';
  }
}

void main() {
  Client client1 = Client('Alice Johnson', 'alice@example.com');
  Client client2 = Client('Bob Smith', 'bob@example.com');
  Ticket ticket1 = Ticket('Paris Tour', 1500.00, DateTime(2024, 10, 1));
  Ticket ticket2 = Ticket('New York Tour', 1200.00, DateTime(2024, 11, 15));

  Cinema cinema = Cinema('City Cinema', '123 Main Street');
  cinema.addTicket(ticket1);
  cinema.addTicket(ticket2);

  Booking booking1 = Booking(client1, ticket1, DateTime.now());
  Booking booking2 = Booking(client2, ticket2, DateTime.now());

  print(cinema);
  cinema.showAvailableTickets();

  print(booking1);
  print(booking2);
}
