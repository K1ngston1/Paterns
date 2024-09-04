// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ticket {
  final String session;
  final int number;
  final int place;
  final double cost;
  bool baricatted = false;

  Ticket({
    required this.session,
    required this.number,
    required this.place,
    required this.cost,
  });
}

class Session {
  final String film;
  final DateTime startime;
  final Hall hall;

  Session({
    required this.film,
    required this.startime,
    required this.hall,
  });
}

class Hall {
  final int rows;
  final int numbersofrows;

  Hall({
    required this.rows,
    required this.numbersofrows,
  });
}

class BoollTicket {
  final List<Ticket> _tickets;
  final List<Ticket> _availableTickets;
  final int maximumCost;

  BoollTicket({required this.maximumCost})
      : _tickets = [],
        _availableTickets = [] {
    // Додаємо квитки до пулу
    for (int i = 1; i <= 100; i++) {
      final ticket = Ticket(
        session: "Людина павук",
        number: i % 6 + 1,
        place: i % 50 + 1,
        cost: 100.0,
      );
      _tickets.add(ticket);
      _availableTickets.add(ticket);
    }
  }

  Ticket getTicket(Session session) {
    for (var ticket in _availableTickets) {
      if (ticket.session == session.film &&
          !ticket.baricatted &&
          ticket.cost <= maximumCost) {
        ticket.baricatted = true;
        _availableTickets.remove(ticket);
        return ticket;
      }
    }
    throw Exception('No available tickets for this session');
  }

  void refundTicket(Ticket ticket) {
    if (ticket.baricatted) {
      ticket.baricatted = false;
      _availableTickets.add(ticket);
    }
  }

  int getAvailableTicketCount() {
    return _availableTickets.length;
  }
}

void main() {
  final ticketPool = BoollTicket(maximumCost: 150);
  final hall = Hall(rows: 6, numbersofrows: 50);
  final session = Session(
      film: "Людина павук",
      startime: DateTime.now().add(Duration(days: 1)),
      hall: hall);

  try {
    final ticket1 = ticketPool.getTicket(session);
    print('Ticket 1: Row ${ticket1.number}, Seat ${ticket1.place}');
    print(
        'Available tickets after first allocation: ${ticketPool.getAvailableTicketCount()}');

    // Тест: Перевірка, чи квиток заброньовано
    print('Is ticket1 baricatted? ${ticket1.baricatted}'); // Має бути true

    // Тест: Повернення квитка
    ticketPool.refundTicket(ticket1);
    print('Ticket 1 returned.');
    print(
        'Available tickets after return: ${ticketPool.getAvailableTicketCount()}');

    // Тест: Перевірка, чи квиток знову доступний
    final ticket2 = ticketPool.getTicket(session);
    print('Ticket 2: Row ${ticket2.number}, Seat ${ticket2.place}');
    print(
        'Available tickets after second allocation: ${ticketPool.getAvailableTicketCount()}');
  } catch (e) {
    print('Error: $e');
  }
}
