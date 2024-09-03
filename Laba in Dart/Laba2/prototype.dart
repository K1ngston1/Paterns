import 'builder.dart';

abstract class IPrototype {
  CinemaPrototype clone();
}

class CinemaPrototype implements IPrototype {
  String name;
  int cost;
  CinemaType type;
  BookingStatus status;
  List<CinemaBase> cinemaTickets;

  CinemaPrototype({
    this.name = "Unnamed Cinema",
    this.cost = 5,
    this.type = CinemaType.small,
    this.status = BookingStatus.available,
    this.cinemaTickets = const [],
  });

  factory CinemaPrototype._fromCinema(CinemaPrototype cinema) {
    return CinemaPrototype(
      name: cinema.name,
      cost: cinema.cost,
      type: cinema.type,
      status: cinema.status,
      cinemaTickets: List<CinemaBase>.from(
          cinema.cinemaTickets.map((ticket) => ticket.clone())),
    );
  }

  @override
  CinemaPrototype clone() {
    return CinemaPrototype._fromCinema(this);
  }

  void updateTicketPrice(CinemaType ticketName, int newPrice) {
    for (var ticket in cinemaTickets) {
      if (ticket.name == ticketName) {
        ticket.updateCost(newPrice);
      }
    }
  }

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
}

void main(List<String> arguments) {
  var cinema = CinemaPrototype(
    name: 'My Cinema',
    cinemaTickets: [
      CinemaBase(name: CinemaType.small, cost: 100, type: TicketType.standard),
      CinemaBase(name: CinemaType.main, cost: 200, type: TicketType.vip)
    ],
  );

  print(cinema);

  print('-----' * 8 + 'New' + '----' * 8);

  var newCinema = cinema.clone();
  newCinema.cinemaTickets.add(
      CinemaBase(name: CinemaType.medium, cost: 150, type: TicketType.child));

  print(newCinema);
  print('------' * 8 + 'Old' + '----' * 8);
  print(cinema);
}
