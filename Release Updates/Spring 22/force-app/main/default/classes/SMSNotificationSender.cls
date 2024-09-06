public class SMSNotificationSender implements NotificationSender {
    public void sendNotification(String message, String recipient) {
        // Logic to send an SMS
        System.debug('Sending SMS to ' + recipient + ' with message: ' + message);
    }
}