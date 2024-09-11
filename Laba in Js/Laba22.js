class CinemaSystem {
  process() {
    this.checkAvailability();
    this.reserveSeats();
    this.purchaseTickets();
    this.sendConfirmation();
  }

  checkAvailability() {
    console.log("Checking seat availability...");
  }

  reserveSeats() {
    // Абстрактний метод
    throw new Error("Method 'reserveSeats()' must be implemented.");
  }

  purchaseTickets() {
    // Абстрактний метод
    throw new Error("Method 'purchaseTickets()' must be implemented.");
  }

  sendConfirmation() {
    console.log("Sending confirmation email to customer...");
  }
}

class OnlineReservation extends CinemaSystem {
  reserveSeats() {
    console.log("Reserving seats online...");
  }

  purchaseTickets() {
    console.log("Processing online payment and purchasing tickets...");
  }
}

class WalkInReservation extends CinemaSystem {
  reserveSeats() {
    console.log("Reserving seats at the box office...");
  }

  purchaseTickets() {
    console.log("Processing payment at the box office...");
  }
}

// Testing the classes
const onlineReservation = new OnlineReservation();
const walkInReservation = new WalkInReservation();

console.log("Online reservation process:");
onlineReservation.process();

console.log("\nWalk-in reservation process:");
walkInReservation.process();
