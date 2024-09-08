import 'dart:collection';

abstract class EventListener {
  void update(String eventData);
}

class BookingListener implements EventListener {
  @override
  void update(String eventData) {
    print('Booking Event: $eventData');
  }
}

class CancellationListener implements EventListener {
  @override
  void update(String eventData) {
    print('Cancellation Event: $eventData');
  }
}

class EventManager {
  final Map<String, List<EventListener>> _listeners = HashMap();

  void subscribe(String eventType, EventListener listener) {
    if (!_listeners.containsKey(eventType)) {
      _listeners[eventType] = [];
    }
    _listeners[eventType]!.add(listener);
  }

  void unsubscribe(String eventType, EventListener listener) {
    _listeners[eventType]?.remove(listener);
  }

  void notify(String eventType, String eventData) {
    final listeners = _listeners[eventType];
    if (listeners != null) {
      for (var listener in listeners) {
        listener.update(eventData);
      }
    }
  }
}

class TicketManager {
  final EventManager _events;

  TicketManager(this._events);

  void bookTicket(String movieTitle) {
    _events.notify("booking", "Booked ticket for $movieTitle");
  }

  void cancelTicket(String movieTitle) {
    _events.notify("cancellation", "Cancelled ticket for $movieTitle");
  }
}

class Application {
  final EventManager _events = EventManager();
  late TicketManager _ticketManager;

  void config() {
    _ticketManager = TicketManager(_events);
    _events.subscribe("booking", BookingListener());
    _events.subscribe("cancellation", CancellationListener());
  }

  void book(String movieTitle) {
    _ticketManager.bookTicket(movieTitle);
  }

  void cancel(String movieTitle) {
    _ticketManager.cancelTicket(movieTitle);
  }
}

void main() {
  Application app = Application();
  app.config();
  app.book("The Avengers");
  app.cancel("The Avengers");
}
