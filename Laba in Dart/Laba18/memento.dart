class Booking {
  late String _movieTitle;
  late DateTime _showtime;
  late int _seats;
  late String _userName;

  Booking(
    this._movieTitle,
    this._showtime,
    this._seats,
    this._userName,
  );

  void setMovieTitle(String title) {
    this._movieTitle = title;
  }

  void setShowtime(DateTime showtime) {
    this._showtime = showtime;
  }

  void setSeats(int seats) {
    this._seats = seats;
  }

  void setUserName(String userName) {
    this._userName = userName;
  }

  BookingSnapshot createSnapshot() {
    return BookingSnapshot(this, _movieTitle, _showtime, _seats, _userName);
  }
}

class BookingSnapshot {
  late Booking _booking;
  late String _movieTitle;
  late DateTime _showtime;
  late int _seats;
  late String _userName;

  BookingSnapshot(
    this._booking,
    this._movieTitle,
    this._showtime,
    this._seats,
    this._userName,
  );

  void restore() {
    _booking.setMovieTitle(_movieTitle);
    _booking.setShowtime(_showtime);
    _booking.setSeats(_seats);
    _booking.setUserName(_userName);
  }
}

class BookingCommand {
  late Booking _booking;
  late BookingSnapshot _backup;

  BookingCommand(this._booking);

  void makeBackup() {
    _backup = _booking.createSnapshot();
  }

  void restoreBackup() {
    _backup.restore();
  }
}

void main() {
  // Створюємо бронювання з початковими даними
  Booking booking =
      Booking("Inception", DateTime(2024, 10, 15, 19, 30), 3, "John Doe");

  // Змінюємо дані бронювання
  booking.setMovieTitle("Interstellar");
  booking.setShowtime(DateTime(2024, 10, 20, 21, 00));
  booking.setSeats(5);
  booking.setUserName("Jane Smith");

  // Створюємо команду для управління резервними копіями
  BookingCommand command = BookingCommand(booking);

  // Робимо резервну копію поточного стану
  command.makeBackup();

  // Виводимо дані бронювання
  print("Current movie title: ${booking._movieTitle}");
  print("Current showtime: ${booking._showtime}");
  print("Current seats: ${booking._seats}");
  print("Current user name: ${booking._userName}");

  // Змінюємо дані бронювання
  booking.setMovieTitle("Dune");
  booking.setShowtime(DateTime(2024, 11, 5, 18, 00));
  booking.setSeats(2);
  booking.setUserName("Alice Johnson");

  // Виводимо нові дані бронювання
  print("Updated movie title: ${booking._movieTitle}");
  print("Updated showtime: ${booking._showtime}");
  print("Updated seats: ${booking._seats}");
  print("Updated user name: ${booking._userName}");

  // Відновлюємо стан бронювання з резервної копії
  command.restoreBackup();

  // Виводимо відновлені дані бронювання
  print("Restored movie title: ${booking._movieTitle}");
  print("Restored showtime: ${booking._showtime}");
  print("Restored seats: ${booking._seats}");
  print("Restored user name: ${booking._userName}");
}
