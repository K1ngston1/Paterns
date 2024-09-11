const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

class Ticket {
  constructor(date, price) {
    this.date = date;
    this.price = price;
  }
}

class Booking {
  constructor() {
    this.tickets = [];
  }

  addTicket(date, price) {
    const ticket = new Ticket(date, price);
    this.tickets.push(ticket);
  }

  getTickets() {
    return this.tickets;
  }
}

const controller = new Booking();

function prompt(question) {
  return new Promise((resolve) => rl.question(question, resolve));
}

async function main() {
  while (true) {
    console.log("1. Add Ticket");
    console.log("2. List Tickets");
    console.log("3. Exit");
    const choice = await prompt("Choose an option: ");

    if (choice === "1") {
      const date = await prompt("Enter ticket date (e.g., 2024-09-12): ");
      const priceString = await prompt("Enter ticket price: ");
      const price = parseFloat(priceString) || 0.0;
      controller.addTicket(date, price);
    } else if (choice === "2") {
      const tickets = controller.getTickets();
      tickets.forEach((ticket) => {
        console.log(`Date: ${ticket.date}, Price: ${ticket.price}`);
      });
    } else if (choice === "3") {
      rl.close();
      break;
    } else {
      console.log("Invalid option. Try again.");
    }
  }
}

main();
