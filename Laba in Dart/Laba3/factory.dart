enum TicketType { Standard, Premium, VIP }

abstract class Ticket {
  final String movieName;
  final String seatNumber;
  final String showTime;

  Ticket(
      {required this.movieName,
      required this.seatNumber,
      required this.showTime});

  double costTicket();

  @override
  String toString() {
    return 'Ticket for movie $movieName at $showTime, seat $seatNumber';
  }
}

class StandardTicket extends Ticket {
  final double basePrice;

  StandardTicket(
      String movieName, String seatNumber, String showTime, this.basePrice)
      : super(movieName: movieName, seatNumber: seatNumber, showTime: showTime);

  @override
  double costTicket() {
    return basePrice;
  }
}

class PremiumTicket extends Ticket {
  final double basePrice;
  final double premiumMultiplier;

  PremiumTicket(String movieName, String seatNumber, String showTime,
      this.basePrice, this.premiumMultiplier)
      : super(movieName: movieName, seatNumber: seatNumber, showTime: showTime);

  @override
  double costTicket() {
    return basePrice * premiumMultiplier;
  }

  @override
  String toString() {
    return super.toString() + ' with Premium services';
  }
}

class VIPTicket extends Ticket {
  final double basePrice;
  final double vipMultiplier;
  final double extraServiceFee;

  VIPTicket(String movieName, String seatNumber, String showTime,
      this.basePrice, this.vipMultiplier, this.extraServiceFee)
      : super(movieName: movieName, seatNumber: seatNumber, showTime: showTime);

  @override
  double costTicket() {
    return (basePrice * vipMultiplier) + extraServiceFee;
  }

  @override
  String toString() {
    return super.toString() + ' with VIP services';
  }
}

class TicketFactory {
  static Ticket createTicket(TicketType ticketType, String movieName,
      String seatNumber, String showTime) {
    switch (ticketType) {
      case TicketType.Standard:
        return StandardTicket(movieName, seatNumber, showTime, 10.0);
      case TicketType.Premium:
        return PremiumTicket(movieName, seatNumber, showTime, 10.0, 1.5);
      case TicketType.VIP:
        return VIPTicket(movieName, seatNumber, showTime, 10.0, 2.0, 5.0);
      default:
        throw ArgumentError('Invalid ticket type');
    }
  }
}

void main(List<String> arguments) {
  for (var type in TicketType.values) {
    var ticket = TicketFactory.createTicket(type, "Avengers", "A1", "18:00");
    print(
        ticket.toString() + ' with cost = \$' + ticket.costTicket().toString());
  }
}
