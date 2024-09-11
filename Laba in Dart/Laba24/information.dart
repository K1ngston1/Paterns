class Ticket {
  double _price;
  Ticket(this._price);
  double get price => _price;
}

class Booking {
  List<Ticket> _tickets;

  Booking(this._tickets);

  // Метод для обчислення загальної вартості всіх квитків
  double totalCost() {
    double total = 0;
    for (var ticket in _tickets) {
      total += ticket.price;
    }
    return total;
  }

  void addTicket(Ticket ticket) {
    _tickets.add(ticket);
  }

  List<Ticket> get tickets => List.unmodifiable(_tickets);
}

void main() {
  var ticket1 = Ticket(10.0);
  var ticket2 = Ticket(12.0);
  var booking = Booking([ticket1, ticket2]);

  print("Загальна вартість: \$${booking.totalCost()}");
  var ticket3 = Ticket(15.0);
  booking.addTicket(ticket3);

  print("Оновлена загальна вартість: \$${booking.totalCost()}");
}
