import 'builder.dart';

class CinemaSingleton {
  static CinemaSingleton? _instance;

  String name = "Палац";
  int cost = 6;
  String type = "Великий";

  BookingStatus status = BookingStatus.available;

  List<CinemaBase> cinemaTickets = [
    CinemaBase(name: CinemaName.main, type: TicketType.standard, cost: 100),
  ];

  CinemaSingleton._(); // Приватний конструктор

  static CinemaSingleton getInstance() {
    return _instance ??= CinemaSingleton._();
  }

  void updateTicketPrice(CinemaName ticketName, int newPrice) {
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
  var cinema = CinemaSingleton.getInstance();
  print(cinema);

  print('---' * 20);

  cinema.name = '0_0'; // Змінюємо ім'я
  cinema.type = "Малий";
  cinema.updateTicketPrice(CinemaName.main, 120);

  var newCinema = CinemaSingleton.getInstance();
  print(identical(cinema, newCinema)); // Перевіряємо, чи це той самий об'єкт

  print('---' * 20);
  print(newCinema);
}
