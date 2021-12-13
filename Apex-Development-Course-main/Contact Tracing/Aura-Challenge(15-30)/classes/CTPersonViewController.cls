/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-10-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   06-10-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class CTPersonViewController {
    @AuraEnabled
    public static void updateHealthStatus(String personId){
        Person__c person = new Person__c(Id=personId);
        person.Health_Status__c = 'Red';
        update person;
    }
}
