abstract class IPaymentService {
  void processPayment(double amount);
}

abstract class IBookingService {
  void bookTicket(String movie, int quantity);
}

class CreditCardPaymentService implements IPaymentService {
  @override
  void processPayment(double amount) {
    print("Processing credit card payment of \$$amount");
  }
}

class PayPalPaymentService implements IPaymentService {
  @override
  void processPayment(double amount) {
    print("Processing PayPal payment of \$$amount");
  }
}

class CinemaBookingService implements IBookingService {
  @override
  void bookTicket(String movie, int quantity) {
    print("Booking $quantity ticket(s) for movie: $movie");
  }
}

class TicketOrderProcessor {
  final IPaymentService _paymentService;
  final IBookingService _bookingService;

  TicketOrderProcessor(this._paymentService, this._bookingService);

  void processOrder(String movie, int quantity, double amount) {
    _bookingService.bookTicket(movie, quantity);
    _paymentService.processPayment(amount);
  }
}

void main() {
  IPaymentService creditCardPaymentService = CreditCardPaymentService();
  IPaymentService payPalPaymentService = PayPalPaymentService();
  IBookingService cinemaBookingService = CinemaBookingService();

  TicketOrderProcessor creditCardOrderProcessor =
      TicketOrderProcessor(creditCardPaymentService, cinemaBookingService);
  TicketOrderProcessor payPalOrderProcessor =
      TicketOrderProcessor(payPalPaymentService, cinemaBookingService);

  print("Processing order with Credit Card:");
  creditCardOrderProcessor.processOrder("Inception", 2, 25.00);

  print("\nProcessing order with PayPal:");
  payPalOrderProcessor.processOrder("Interstellar", 3, 30.00);
}
