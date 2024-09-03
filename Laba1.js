// Enum-like constants in JavaScript
const TicketType = {
  STANDARD: "standard",
  CHILD: "child",
  VIP: "vip",
};

const CinemaName = {
  MAIN: "main",
  SMALL: "small",
  MEDIUM: "medium",
};

const SessionType = {
  STANDARD_2D: "standard2D",
  IMAX_3D: "imax3D",
  DOLBY_ATMOS: "dolbyAtmos",
};

const BookingStatus = {
  AVAILABLE: "available",
  RESERVED: "reserved",
  SOLD: "sold",
};

const MovieSessionTime = {
  MORNING: "morning",
  AFTERNOON: "afternoon",
  EVENING: "evening",
  NIGHT: "night",
};

class CinemaBase {
  constructor(name, cost, type, status = BookingStatus.AVAILABLE) {
    this.name = name;
    this.cost = cost;
    this.type = type;
    this.status = status;
  }

  reserve() {
    if (this.status === BookingStatus.AVAILABLE) {
      this.status = BookingStatus.RESERVED;
    }
  }

  sell() {
    if (this.status === BookingStatus.RESERVED) {
      this.status = BookingStatus.SOLD;
    }
  }

  updateCost(newCost) {
    this.cost = newCost;
  }

  toString() {
    return `Ціна квитка: ${this.cost} (without decimals), Type: ${this.type}\n`;
  }
}

class CinemaSingleton {
  static instance = null;

  constructor() {
    if (CinemaSingleton.instance) {
      return CinemaSingleton.instance;
    }

    this.name = "Палац";
    this.cost = 6;
    this.type = "Великий";
    this.status = BookingStatus.AVAILABLE;

    this.cinemaTickets = [
      new CinemaBase(CinemaName.MAIN, 100, TicketType.STANDARD),
    ];

    CinemaSingleton.instance = this;
  }

  static getInstance() {
    if (!CinemaSingleton.instance) {
      new CinemaSingleton();
    }
    return CinemaSingleton.instance;
  }

  updateTicketPrice(ticketName, newPrice) {
    this.cinemaTickets.forEach((ticket) => {
      if (ticket.name === ticketName) {
        ticket.updateCost(newPrice);
      }
    });
  }

  toString() {
    let infoStr = `Cinema: ${this.name}\n`;
    infoStr += `Type: ${this.type}\n`;
    infoStr += `Tickets:\n`;

    this.cinemaTickets.forEach((ticket) => {
      infoStr += `- ${ticket.toString()}\n`;
    });
    return infoStr;
  }
}

// Main function
function main() {
  const cinema = CinemaSingleton.getInstance();
  console.log(cinema.toString());

  console.log("---".repeat(20));

  cinema.name = "0_0"; // Змінюємо ім'я
  cinema.type = "Малий";
  cinema.updateTicketPrice(CinemaName.MAIN, 120);

  const newCinema = CinemaSingleton.getInstance();
  console.log(cinema === newCinema); // Перевіряємо, чи це той самий об'єкт

  console.log("---".repeat(20));
  console.log(newCinema.toString());
}

main();
