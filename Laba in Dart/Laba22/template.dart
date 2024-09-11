class CinemaSystem {
  void process() {
    checkAvailability();
    reserveSeats();
    purchaseTickets();
    sendConfirmation();
  }

  void checkAvailability() {
    print("Checking seat availability...");
  }

  void reserveSeats() {
    // Абстрактний метод
  }

  void purchaseTickets() {
    // Абстрактний метод
  }

  void sendConfirmation() {
    print("Sending confirmation email to customer...");
  }
}

class OnlineReservation extends CinemaSystem {
  @override
  void reserveSeats() {
    print("Reserving seats online...");
  }

  @override
  void purchaseTickets() {
    print("Processing online payment and purchasing tickets...");
  }
}

class WalkInReservation extends CinemaSystem {
  @override
  void reserveSeats() {
    print("Reserving seats at the box office...");
  }

  @override
  void purchaseTickets() {
    print("Processing payment at the box office...");
  }
}

void main() {
  CinemaSystem onlineReservation = OnlineReservation();
  CinemaSystem walkInReservation = WalkInReservation();

  print("Online reservation process:");
  onlineReservation.process();

  print("\nWalk-in reservation process:");
  walkInReservation.process();
}
