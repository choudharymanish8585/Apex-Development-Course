public with sharing class QuiddityExample {
    public static void logMessage(String message) {
        // Todo: Get the quiddity of the current request
        Quiddity quiddity = Request.getCurrent().getQuiddity();
        // Todo: Log different messages or take different actions based on the context
        switch on quiddity {
            when ANONYMOUS {
                System.debug('Executing anonymous apex. Log ' + message);
            }
            when SYNCHRONOUS {
                System.debug('Executing SYNCHRONOUS apex. Log ' + message);
            }
        }
    }
}
