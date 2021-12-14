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
public with sharing class CTPersonTriggerHandler {
    
    public static void beforeInsert(List<Person__c> newRecords){
        // Before insert operation for Person__c object
        // make sure the health status is green
        // generate unique token for each record
        for(Person__c person: newRecords){
             // update person status to Green
            person.Health_Status__c = 'Green';
             // generate unique token
            person.Token__c = CTPersonController.getToken(person.Mobile__c);
        }
    }
    
    // Before update operation for Person__c object
    public static void beforeUpdate(List<Person__c> newRecords, Map<Id, Person__c> oldRecordsMap){
        for(Person__c person : newRecords){
            // check if the status changed in this transaction
            // also update Status_Update_Date__c
            if( person.Health_Status__c != oldRecordsMap.get(person.id).Health_Status__c){
                person.Status_Update_Date__c = Date.today();
            }
        }
    }
}
