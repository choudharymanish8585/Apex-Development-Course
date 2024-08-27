trigger AccountTrigger on Account(after update) {
    switch on Trigger.operationType {
        when AFTER_UPDATE {
            AccountTriggerHandler.afterUpdateHandler(Trigger.new);
        }
    }
}
