public with sharing class OrderStatusProcessing {
    public enum OrderStatus {
        PROCESSING,
        SHIPPED,
        DELIVERED,
        CANCELLED
    }

    public void processStatus(String status) {
        /* for (OrderStatus os : OrderStatus.values()) {
            if (os.name() == status) {
                // add main logic here
                System.debug('os: ' + os);
            }
        } */
        System.debug('os: ' + OrderStatus.valueOf(status));
    }
}
