enum CinemaType { small, medium, large }

enum BookingStatus { available, booked, closed }

class CinemaBuilder {
  String _name;
  int _cost;
  CinemaType _type;
  BookingStatus _status;
  List<Ticket> _cinemaTickets;

  CinemaBuilder({
    String name = "Unnamed Cinema",
    int cost = 5,
    CinemaType type = CinemaType.small,
    BookingStatus status = BookingStatus.available,
    List<Ticket> cinemaTickets = const [],
  })  : _name = name,
        _cost = cost,
        _type = type,
        _status = status,
        _cinemaTickets = cinemaTickets;

  int get cost => _cost;
  String get name => _name;
  CinemaType get type => _type;
  BookingStatus get status => _status;
  List<Ticket> get cinemaTickets => _cinemaTickets;

  set name(String name) => _name = name;
  set cost(int cost) => _cost = cost;
  set type(CinemaType type) => _type = type;
  set status(BookingStatus status) => _status = status;
  set cinemaTickets(List<Ticket> tickets) => _cinemaTickets = tickets;

  Cinema build() {
    return Cinema(this);
  }
}

class Cinema {
  final String name;
  final int cost;
  final CinemaType type;
  final BookingStatus status;
  final List<Ticket> cinemaTickets;

  Cinema(CinemaBuilder builder)
      : name = builder.name,
        cost = builder.cost,
        type = builder.type,
        status = builder.status,
        cinemaTickets = builder.cinemaTickets;

  @override
  String toString() {
    var infoStr = 'Cinema: $name\n';
    infoStr += 'Type: $type\n';
    infoStr += 'Tickets:\n';
    for (var ticket in cinemaTickets) {
      infoStr += '- ${ticket.toString()}\n';
    }
    return infoStr;
  }

  static CinemaBuilder get builder => CinemaBuilder();
}

class Ticket {
  final String ticketType;
  final double price;

  Ticket(this.ticketType, this.price);

  @override
  String toString() {
    return 'Ticket Type: $ticketType, Price: $price';
  }
}

void main(List<String> arguments) {
  var cinemaBuilder = Cinema.builder;

  cinemaBuilder
    ..name = "Majestic Cinema"
    ..cost = 20
    ..type = CinemaType.large
    ..status = BookingStatus.available
    ..cinemaTickets = [
      Ticket('Regular', 10.0),
      Ticket('VIP', 25.0),
    ];

  var cinema = cinemaBuilder.build();
  print(cinema);
  print('----' * 20);

  var newCinema = (cinemaBuilder
        ..name = "Majestic Cinema2"
        ..cost = 56
        ..type = CinemaType.small
        ..status = BookingStatus.available
        ..cinemaTickets = [
          Ticket('Regular', 10.0),
          Ticket('Regular', 10.0),
          Ticket('VIP', 25.0),
          Ticket('Regular', 10.0),
        ])
      .build();

  print(newCinema);
}
