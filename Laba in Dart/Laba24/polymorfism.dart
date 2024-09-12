abstract class Ticket {
  void displayDetails();
}

class StandardTicket extends Ticket {
  @override
  void displayDetails() {
    print("Standard Ticket: \$10");
  }
}

class VIPTicket extends Ticket {
  @override
  void displayDetails() {
    print("VIP Ticket: \$50");
  }
}

void printTicketDetails(Ticket ticket) {
  ticket.displayDetails();
}

void main() {
  Ticket standard = StandardTicket();
  Ticket vip = VIPTicket();

  printTicketDetails(standard);
  printTicketDetails(vip);
}
