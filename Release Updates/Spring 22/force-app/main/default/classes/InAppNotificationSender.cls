public class InAppNotificationSender implements NotificationSender {
    public void sendNotification(String message, String recipient) {
        // Logic to send an in-app notification
        System.debug('Sending in-app notification to ' + recipient + ' with message: ' + message);
    }
}