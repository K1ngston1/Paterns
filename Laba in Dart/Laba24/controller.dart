import 'dart:io';

class Ticket {
  late String _date;
  late double _price;

  Ticket(this._date, this._price);

  String get date => _date;
  double get price => _price;
}

class Booking {
  List<Ticket> tickets = [];

  void addTicket(String date, double price) {
    final ticket = Ticket(date, price);
    tickets.add(ticket);
  }

  List<Ticket> getTickets() {
    return tickets;
  }
}

void main() {
  final controller = Booking();

  while (true) {
    print('1. Add Ticket');
    print('2. List Tickets');
    print('3. Exit');
    stdout.write('Choose an option: ');

    final choice = stdin.readLineSync();
    if (choice == '1') {
      stdout.write('Enter ticket date (e.g., 2024-09-12): ');
      final date = stdin.readLineSync() ?? '';
      stdout.write('Enter ticket price: ');
      final priceString = stdin.readLineSync() ?? '';
      final price = double.tryParse(priceString) ?? 0.0;
      controller.addTicket(date, price);
    } else if (choice == '2') {
      final tickets = controller.getTickets();
      for (var ticket in tickets) {
        print('Date: ${ticket.date}, Price: ${ticket.price}');
      }
    } else if (choice == '3') {
      break;
    } else {
      print('Invalid option. Try again.');
    }
  }
}
