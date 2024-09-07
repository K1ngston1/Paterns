// ignore_for_file: public_member_api_docs, sort_constructors_first
enum TicketType { regular, vip, student, none }

class RequestBooking {
  final List<String> _description;
  final TicketType _ticketType;

  RequestBooking(
    this._description,
    this._ticketType,
  );

  List<String> get description => _description;
  TicketType get ticketType => _ticketType;
}

// Abstract Handler class
abstract class Handler {
  final Handler? _successor;

  Handler([Handler? successor]) : _successor = successor;

  void handle(RequestBooking request) {
    var result = _checkRequest(request.ticketType);
    if (!result && (_successor != null)) {
      _successor.handle(request);
    }
  }

  bool _checkRequest(TicketType ticketType);
}

// TicketSellerHandler checks the availability of tickets
class TicketSellerHandler extends Handler {
  TicketSellerHandler([Handler? successor]) : super(successor);

  @override
  bool _checkRequest(TicketType ticketType) {
    var available = ticketType != TicketType.none;
    if (available) {
      print('TicketSeller processes the ticket request');
    } else {
      print('TicketSeller rejects the booking request');
    }
    return !available;
  }
}

// PaymentHandler processes the payment
class PaymentHandler extends Handler {
  PaymentHandler([Handler? successor]) : super(successor);

  @override
  bool _checkRequest(TicketType ticketType) {
    var paymentProcessed = <TicketType>[
      TicketType.regular,
      TicketType.vip,
      TicketType.student
    ].contains(ticketType);
    if (paymentProcessed) {
      print('Payment is being processed');
    } else {
      print('Payment failed or invalid ticket type');
    }
    return !paymentProcessed;
  }
}

// BookingConfirmationHandler confirms the booking
class BookingConfirmationHandler extends Handler {
  BookingConfirmationHandler([Handler? successor]) : super(successor);

  @override
  bool _checkRequest(TicketType ticketType) {
    var confirmed = ticketType == TicketType.regular ||
        ticketType == TicketType.vip ||
        ticketType == TicketType.student;
    if (confirmed) {
      print('Booking confirmed! Enjoy your movie.');
    } else {
      print('Booking confirmation failed');
    }
    return !confirmed;
  }
}

void main() {
  // Create the handlers and link them
  var bookingConfirmation = BookingConfirmationHandler();
  var payment = PaymentHandler(bookingConfirmation);
  var ticketSeller = TicketSellerHandler(payment);

  // Create a booking request
  var request = <String>['Movie: Inception', 'Showtime: 18:00'];
  var requestBooking = RequestBooking(request, TicketType.regular);

  // Start the chain of responsibility
  ticketSeller.handle(requestBooking);
}
