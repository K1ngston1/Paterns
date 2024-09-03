abstract interface class ITicket {
  String getTicketInfo();
  void setTicketInfo(String info);
}

abstract interface class IReservation {
  void bookTicket(ITicket ticket);
  void cancelTicket(ITicket ticket);
  List<ITicket> getReservedTickets();
}

class MovieTicket implements ITicket {
  String info;

  MovieTicket(this.info);

  @override
  String getTicketInfo() {
    return info;
  }

  @override
  void setTicketInfo(String info) {
    this.info = info;
  }
}

class ReservationSystem implements IReservation {
  List<ITicket> _reservedTickets = [];

  @override
  void bookTicket(ITicket ticket) {
    _reservedTickets.add(ticket);
    print('Ticket booked: ${ticket.getTicketInfo()}');
  }

  @override
  void cancelTicket(ITicket ticket) {
    _reservedTickets.remove(ticket);
    print('Ticket cancelled: ${ticket.getTicketInfo()}');
  }

  @override
  List<ITicket> getReservedTickets() {
    return List.from(_reservedTickets);
  }
}

void printReservedTickets(IReservation reservationSystem) {
  print('Reserved Tickets:');
  for (var ticket in reservationSystem.getReservedTickets()) {
    print(ticket.getTicketInfo());
  }
}

void main(List<String> arguments) {
  var reservationSystem = ReservationSystem();

  var ticket1 = MovieTicket('Movie A - Seat 1');
  var ticket2 = MovieTicket('Movie B - Seat 2');

  reservationSystem.bookTicket(ticket1);
  reservationSystem.bookTicket(ticket2);

  printReservedTickets(reservationSystem);

  print('--------');
  print('Cancelling Ticket');
  print('-------------');

  reservationSystem.cancelTicket(ticket1);

  printReservedTickets(reservationSystem);
}
