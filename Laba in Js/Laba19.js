// Abstract class for event listeners
class EventListener {
  update(eventData) {
    throw new Error("Method 'update' must be implemented.");
  }
}

// BookingListener that handles booking events
class BookingListener extends EventListener {
  update(eventData) {
    console.log(`Booking Event: ${eventData}`);
  }
}

// CancellationListener that handles cancellation events
class CancellationListener extends EventListener {
  update(eventData) {
    console.log(`Cancellation Event: ${eventData}`);
  }
}

// EventManager to manage listeners and notify them of events
class EventManager {
  constructor() {
    this._listeners = new Map();
  }

  subscribe(eventType, listener) {
    if (!this._listeners.has(eventType)) {
      this._listeners.set(eventType, []);
    }
    this._listeners.get(eventType).push(listener);
  }

  unsubscribe(eventType, listener) {
    if (this._listeners.has(eventType)) {
      const listeners = this._listeners.get(eventType);
      this._listeners.set(
        eventType,
        listeners.filter((l) => l !== listener)
      );
    }
  }

  notify(eventType, eventData) {
    if (this._listeners.has(eventType)) {
      const listeners = this._listeners.get(eventType);
      listeners.forEach((listener) => listener.update(eventData));
    }
  }
}

// TicketManager class to manage ticket operations and trigger events
class TicketManager {
  constructor(eventManager) {
    this._events = eventManager;
  }

  bookTicket(movieTitle) {
    this._events.notify("booking", `Booked ticket for ${movieTitle}`);
  }

  cancelTicket(movieTitle) {
    this._events.notify("cancellation", `Cancelled ticket for ${movieTitle}`);
  }
}

// Application class to configure and manage ticket operations
class Application {
  constructor() {
    this._events = new EventManager();
    this._ticketManager = new TicketManager(this._events);
  }

  config() {
    this._events.subscribe("booking", new BookingListener());
    this._events.subscribe("cancellation", new CancellationListener());
  }

  book(movieTitle) {
    this._ticketManager.bookTicket(movieTitle);
  }

  cancel(movieTitle) {
    this._ticketManager.cancelTicket(movieTitle);
  }
}

// Main function to run the application
function main() {
  const app = new Application();
  app.config();
  app.book("The Avengers");
  app.cancel("The Avengers");
}

// Run the main function
main();
