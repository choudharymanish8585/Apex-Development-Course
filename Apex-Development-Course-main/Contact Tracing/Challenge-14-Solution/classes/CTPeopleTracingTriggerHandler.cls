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
public with sharing class CTPeopleTracingTriggerHandler {
    
    public static void beforeInsert(List<People_Tracing__c> newRecords){
        List<People_Tracing__c> duplicates = CTPeopleTracingController.checkDuplicates(newRecords);

        for(People_Tracing__c trace : duplicates){
            trace.addError('Duplicate record found. Person 1:'+trace.Person_1__c+' Person 2:'+trace.Person_2__c);
        }
    }
}
