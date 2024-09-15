abstract class Ticket {
  String getTicketInfo();
}

class StandardTicket extends Ticket {
  @override
  String getTicketInfo() {
    return "Standard Ticket";
  }
}

class VIP extends Ticket {
  @override
  String getTicketInfo() {
    return "VIP Ticket";
  }
}

void printTicketInfo(Ticket ticket) {
  print(ticket.getTicketInfo());
}

void main() {
  Ticket standardTicket = StandardTicket();
  Ticket vipTicket = VIP();

  printTicketInfo(standardTicket); // Output: Standard Ticket
  printTicketInfo(vipTicket); // Output: VIP Ticket
}

//Функція printTicketInfo може приймати як StandardTicket, так і VIP, і її поведінка залишається коректною. Це є прикладом дотримання Принципу підставлення Лісков.