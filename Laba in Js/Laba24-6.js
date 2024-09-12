// Базовий клас (у JS це просто клас)
class Ticket {
  displayDetails() {
    // Метод, який буде перевизначений в підкласах
    throw new Error("This method should be overridden");
  }
}

// Клас для стандартного квитка
class StandardTicket extends Ticket {
  displayDetails() {
    console.log("Standard Ticket: $10");
  }
}

// Клас для VIP-квитка
class VIPTicket extends Ticket {
  displayDetails() {
    console.log("VIP Ticket: $50");
  }
}

// Функція, яка приймає будь-який тип квитка
function printTicketDetails(ticket) {
  ticket.displayDetails();
}

// Використання
const standard = new StandardTicket();
const vip = new VIPTicket();

printTicketDetails(standard); // Standard Ticket: $10
printTicketDetails(vip); // VIP Ticket: $50
