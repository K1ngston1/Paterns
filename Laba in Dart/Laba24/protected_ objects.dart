abstract class NotificationService {
  void sendNotification(String message);
}

class EmailNotificationService implements NotificationService {
  @override
  void sendNotification(String message) {
    print('Sending email with message: $message');
  }
}

class SMSNotificationService implements NotificationService {
  @override
  void sendNotification(String message) {
    print('Sending SMS with message: $message');
  }
}

class TicketBookingNotificationManager {
  final NotificationService _notificationService;

  TicketBookingNotificationManager(this._notificationService);

  void notifyUserAboutBooking(String userName, String movieTitle) {
    String message =
        'Dear $userName, your booking for "$movieTitle" has been confirmed!';
    _notificationService.sendNotification(message);
  }

  void notifyUserAboutBookingCancellation(String userName, String movieTitle) {
    String message =
        'Dear $userName, your booking for "$movieTitle" has been cancelled.';
    _notificationService.sendNotification(message);
  }
}

void main() {
  NotificationService emailService = EmailNotificationService();
  TicketBookingNotificationManager emailNotificationManager =
      TicketBookingNotificationManager(emailService);
  emailNotificationManager.notifyUserAboutBooking(
      'Alice', 'The Grand Adventure');
  emailNotificationManager.notifyUserAboutBookingCancellation(
      'Alice', 'The Grand Adventure');

  NotificationService smsService = SMSNotificationService();
  TicketBookingNotificationManager smsNotificationManager =
      TicketBookingNotificationManager(smsService);
  smsNotificationManager.notifyUserAboutBooking('Bob', 'The Grand Adventure');
  smsNotificationManager.notifyUserAboutBookingCancellation(
      'Bob', 'The Grand Adventure');
}
