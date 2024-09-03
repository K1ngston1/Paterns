abstract class IBooking {
  int cost();
  String description();
}

class Ticket implements IBooking {
  final int _cost;
  final String _movieName;
  final String _seatNumber;

  Ticket({
    required int cost,
    required String movieName,
    required String seatNumber,
  })  : _cost = cost,
        _movieName = movieName,
        _seatNumber = seatNumber;

  @override
  int cost() => _cost;

  @override
  String description() => 'Ticket for $_movieName, Seat: $_seatNumber';
}

class Order implements IBooking {
  final String _orderId;
  final List<IBooking> bookings = [];

  Order({
    required String orderId,
  }) : _orderId = orderId;

  @override
  int cost() {
    var totalCost = 0;
    bookings.forEach((booking) {
      totalCost += booking.cost();
    });
    return totalCost;
  }

  void addBooking(IBooking booking) {
    bookings.add(booking);
  }

  void removeBooking(IBooking booking) {
    bookings.remove(booking);
  }

  @override
  String description() => 'Order $_orderId';
}

class CinemaOrder extends Order {
  CinemaOrder(String orderId) : super(orderId: orderId);

  @override
  int cost() {
    var totalCost = 0;
    bookings.forEach((booking) {
      var currentCost = booking.cost();
      print('Cost of ${booking.description()} = $currentCost currency');
      totalCost += currentCost;
    });
    print('Total cost of ${description()} = $totalCost currency');
    return totalCost;
  }
}

void main() {
  var ticket1 = Ticket(movieName: "Movie A", seatNumber: "A1", cost: 10);
  var ticket2 = Ticket(movieName: "Movie A", seatNumber: "A2", cost: 10);
  var ticket3 = Ticket(movieName: "Movie B", seatNumber: "B1", cost: 12);

  var order1 = CinemaOrder("Order001");
  order1.addBooking(ticket1);
  order1.addBooking(ticket2);
  order1.addBooking(ticket3);

  order1.cost();
}
