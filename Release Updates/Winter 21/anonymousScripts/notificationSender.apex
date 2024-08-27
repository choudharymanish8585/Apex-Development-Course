// Get the Id for our custom notification type
CustomNotificationType notificationType = [
    SELECT Id, DeveloperName
    FROM CustomNotificationType
    WHERE DeveloperName = 'Winter21'
];

// Create a new custom notification
Messaging.CustomNotification notification = new Messaging.CustomNotification();

// Set the contents for the notification
notification.setTitle('Apex Custom Notification Post Winter 21 Release');
notification.setBody(
    'The notifications are coming from INSIDE the Apex! Test for course updates'
);

// Set the notification type and target
notification.setNotificationTypeId(notificationType.Id);
notification.setTargetId(UserInfo.getUserId());

Set<String> recipientsIds = new Set<String>();
recipientsIds.add(UserInfo.getUserId());
// Actually send the notification
try {
    notification.send(recipientsIds);
} catch (Exception e) {
    System.debug('Problem sending notification: ' + e.getMessage());
}
