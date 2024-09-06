public class EmailNotificationSender implements NotificationSender {
    public void sendNotification(String message, String recipient) {
        // Logic to send an email
        System.debug('Sending email to ' + recipient + ' with message: ' + message);
    }
}