class Booking {
  constructor(movieTitle, showtime, seats, userName) {
    this._movieTitle = movieTitle;
    this._showtime = showtime;
    this._seats = seats;
    this._userName = userName;
  }

  setMovieTitle(title) {
    this._movieTitle = title;
  }

  setShowtime(showtime) {
    this._showtime = showtime;
  }

  setSeats(seats) {
    this._seats = seats;
  }

  setUserName(userName) {
    this._userName = userName;
  }

  createSnapshot() {
    return new BookingSnapshot(
      this,
      this._movieTitle,
      this._showtime,
      this._seats,
      this._userName
    );
  }
}

class BookingSnapshot {
  constructor(booking, movieTitle, showtime, seats, userName) {
    this._booking = booking;
    this._movieTitle = movieTitle;
    this._showtime = showtime;
    this._seats = seats;
    this._userName = userName;
  }

  restore() {
    this._booking.setMovieTitle(this._movieTitle);
    this._booking.setShowtime(this._showtime);
    this._booking.setSeats(this._seats);
    this._booking.setUserName(this._userName);
  }
}

class BookingCommand {
  constructor(booking) {
    this._booking = booking;
    this._backup = null;
  }

  makeBackup() {
    this._backup = this._booking.createSnapshot();
  }

  restoreBackup() {
    if (this._backup) {
      this._backup.restore();
    } else {
      console.log("No backup to restore.");
    }
  }
}

// Example usage:
const booking = new Booking(
  "Inception",
  new Date(2024, 9, 15, 19, 30),
  3,
  "John Doe"
);

// Update booking
booking.setMovieTitle("Interstellar");
booking.setShowtime(new Date(2024, 9, 20, 21, 0));
booking.setSeats(5);
booking.setUserName("Jane Smith");

// Create command for managing backups
const command = new BookingCommand(booking);

// Make backup of the current state
command.makeBackup();

console.log("Current booking:");
console.log(`Movie title: ${booking._movieTitle}`);
console.log(`Showtime: ${booking._showtime}`);
console.log(`Seats: ${booking._seats}`);
console.log(`User name: ${booking._userName}`);

// Update booking
booking.setMovieTitle("Dune");
booking.setShowtime(new Date(2024, 10, 5, 18, 0));
booking.setSeats(2);
booking.setUserName("Alice Johnson");

console.log("Updated booking:");
console.log(`Movie title: ${booking._movieTitle}`);
console.log(`Showtime: ${booking._showtime}`);
console.log(`Seats: ${booking._seats}`);
console.log(`User name: ${booking._userName}`);

// Restore the booking to the backup state
command.restoreBackup();

console.log("Restored booking:");
console.log(`Movie title: ${booking._movieTitle}`);
console.log(`Showtime: ${booking._showtime}`);
console.log(`Seats: ${booking._seats}`);
console.log(`User name: ${booking._userName}`);
