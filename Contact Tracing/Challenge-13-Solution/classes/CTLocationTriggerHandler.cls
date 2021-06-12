/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-02-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   06-02-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class CTLocationTriggerHandler {
    
    public static void beforeInsert(List<Location__c> newRecords){
        for (Location__c location : newRecords) {
            location.Status__c = 'Green';
        }
    }


    public static void beforeUpdate(List<Location__c> newRecords, Map<Id, Location__c> oldRecordMap){
        for (Location__c location : newRecords) {
            if(location.Status__c != oldRecordMap.get(location.Id).Status__c){
                location.Status_Update_Date__c = Date.today();
            }
        }
    }


    public static void afterUpdate(List<Location__c> newRecords, Map<Id, Location__c> oldRecordMap){
        Set<Id> statusChange = new Set<Id>();
        for(Location__c location : newRecords){
            if(location.Status__c == 'Red' && oldRecordMap.get(location.Id).Status__c != 'Red'){
                statusChange.add(location.Id);
            }
        }

        List<Location_Tracing__c> locationTraces = CTLocationTracingController.getLocationsByLocationIds(statusChange);
        Set<Id> personIds = new Set<Id>();
        for (Location_Tracing__c trace : locationTraces) {
            personIds.add(trace.Person__c);
        }

        List<Person__c> peopleToUpdate = new List<Person__c>();
        for (Id pid : personIds) {
            peopleToUpdate.add(new Person__c(Id=pid, Health_Status__c='Yellow'));
        }

        if(peopleToUpdate.size() > 0){
            update peopleToUpdate;
        }
    }
}
