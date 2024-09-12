// Абстрактний клас NotificationService
class NotificationService {
  sendNotification(message) {
    throw new Error("Method not implemented");
  }
}

// Клас EmailNotificationService
class EmailNotificationService extends NotificationService {
  sendNotification(message) {
    console.log(`Sending email with message: ${message}`);
  }
}

// Клас SMSNotificationService
class SMSNotificationService extends NotificationService {
  sendNotification(message) {
    console.log(`Sending SMS with message: ${message}`);
  }
}

// Клас TicketBookingNotificationManager
class TicketBookingNotificationManager {
  constructor(notificationService) {
    this.notificationService = notificationService;
  }

  notifyUserAboutBooking(userName, movieTitle) {
    const message = `Dear ${userName}, your booking for "${movieTitle}" has been confirmed!`;
    this.notificationService.sendNotification(message);
  }

  notifyUserAboutBookingCancellation(userName, movieTitle) {
    const message = `Dear ${userName}, your booking for "${movieTitle}" has been cancelled.`;
    this.notificationService.sendNotification(message);
  }
}

// Основна функція
function main() {
  // Приклад використання з EmailNotificationService
  const emailService = new EmailNotificationService();
  const emailNotificationManager = new TicketBookingNotificationManager(
    emailService
  );
  emailNotificationManager.notifyUserAboutBooking(
    "Alice",
    "The Grand Adventure"
  );
  emailNotificationManager.notifyUserAboutBookingCancellation(
    "Alice",
    "The Grand Adventure"
  );

  // Приклад використання з SMSNotificationService
  const smsService = new SMSNotificationService();
  const smsNotificationManager = new TicketBookingNotificationManager(
    smsService
  );
  smsNotificationManager.notifyUserAboutBooking("Bob", "The Grand Adventure");
  smsNotificationManager.notifyUserAboutBookingCancellation(
    "Bob",
    "The Grand Adventure"
  );
}

// Виклик основної функції
main();
