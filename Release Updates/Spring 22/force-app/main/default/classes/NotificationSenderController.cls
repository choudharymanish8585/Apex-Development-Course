public with sharing class NotificationSenderController {
    @AuraEnabled
    public static void send(String type, String msg, String receipent) {
        try {
            if (type == null || msg == null || receipent == null) {
                throw new AuraHandledException('Type or Message or Receipent cannot be null');
            }

            // Create an instance of the class that implements NotificationSender
            NotificationSender ns = (NotificationSender) System.Type.forName(type).newInstance();
            ns.sendNotification(msg, receipent);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}