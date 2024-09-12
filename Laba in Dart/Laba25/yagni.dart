class Movie {
  // використання Yagni бо ми маємо додавання віднімання і тд
  String title;
  String genre;

  Movie(this.title, this.genre);

  @override
  String toString() {
    return 'Title: $title\nGenre: $genre';
  }
}

class Booking {
  Movie movie;
  String customerName;
  int numberOfTickets;

  Booking(this.movie, this.customerName, this.numberOfTickets);

  @override
  String toString() {
    return 'Movie: ${movie.title}\nCustomer: $customerName\nTickets: $numberOfTickets';
  }
}

class BookingManager {
  List<Booking> _bookings = [];

  void addBooking(Movie movie, String customerName, int numberOfTickets) {
    var booking = Booking(movie, customerName, numberOfTickets);
    _bookings.add(booking);
    print("Booking for '${movie.title}' by $customerName added.");
  }

  void listBookings() {
    if (_bookings.isEmpty) {
      print("No bookings available.");
    } else {
      for (int i = 0; i < _bookings.length; i++) {
        print("\nBooking ${i + 1}:\n${_bookings[i]}");
      }
    }
  }

  void removeBooking(int index) {
    if (index >= 0 && index < _bookings.length) {
      _bookings.removeAt(index);
      print("Booking at index $index removed.");
    } else {
      print("Invalid index.");
    }
  }
}

void main() {
  var manager = BookingManager();

  var movie1 = Movie("Inception", "Sci-Fi");
  var movie2 = Movie("The Godfather", "Crime");

  manager.addBooking(movie1, "Alice Johnson", 2);
  manager.addBooking(movie2, "Bob Smith", 4);

  print("\nBookings list:");
  manager.listBookings();

  manager.removeBooking(0);

  print("\nBookings list after removal:");
  manager.listBookings();
}
