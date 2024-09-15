abstract class Ticket {
  double getPrice();
  String getDescription();
}

class RegularTicket implements Ticket {
  @override
  double getPrice() {
    return 10.0;
  }

  @override
  String getDescription() {
    return 'Regular Ticket';
  }
}

class VIPTicket implements Ticket {
  @override
  double getPrice() {
    return 20.0;
  }

  @override
  String getDescription() {
    return 'VIP Ticket with extra comfort';
  }
}

class Booking {
  List<Ticket> tickets = [];

  void addTicket(Ticket ticket) {
    tickets.add(ticket);
  }

  double calculateTotal() {
    return tickets.fold(0.0, (total, ticket) => total + ticket.getPrice());
  }

  void printReceipt() {
    for (var ticket in tickets) {
      print('${ticket.getDescription()}: \$${ticket.getPrice()}');
    }
    print('Total: \$${calculateTotal()}');
  }
}

void main() {
  Booking booking = Booking();

  booking.addTicket(RegularTicket());
  booking.addTicket(VIPTicket());

  booking.printReceipt();
}
