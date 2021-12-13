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
public with sharing class CTPersonTabController {
    @AuraEnabled
    public static UserInformation getPersonDetails(String recordId) {
        UserInformation info = new UserInformation();

        Person__c person = CTPersonController.getPersonById(recordId);
        if (person != null) {
            info.name = person.Name;
            info.token = person.Token__c;
            info.statusUpdateOn = person.Status_Update_Date__c;
            info.phone = person.Mobile__c;
            info.status = person.Health_Status__c;
        }

        List<People_Tracing__c> traces = CTPeopleTracingController.getTraces(recordId);

        if (traces != null && traces.size() > 0) {
            List<CloseContacts> closeContacts = new List<CloseContacts>();
            Set<Id> uniqueIds = new Set<Id>();
            uniqueIds.add(recordId);

            for (People_Tracing__c trace : traces) {
                CloseContacts cc = new CloseContacts();
                if (!uniqueIds.contains(trace.Person_1__c)) {
                    cc.id = trace.Person_1__c;
                    cc.status = trace.Person_1__r.Health_Status__c;
                    cc.token = trace.Person_1__r.Token__c;
                    cc.contactDate = trace.Contact_Date__c;
                }
                if (!uniqueIds.contains(trace.Person_2__c)) {
                    cc.id = trace.Person_2__c;
                    cc.status = trace.Person_2__r.Health_Status__c;
                    cc.token = trace.Person_2__r.Token__c;
                    cc.contactDate = trace.Contact_Date__c;
                }
                closeContacts.add(cc);
            }

            info.contacts = closeContacts;
            info.contactsCount = closeContacts.size();
        }
        return info;
    }

    public class UserInformation {
        @AuraEnabled
        public String name;
        @AuraEnabled
        public String token;
        @AuraEnabled
        public Date statusUpdateOn;
        @AuraEnabled
        public String phone;
        @AuraEnabled
        public String status;
        @AuraEnabled
        public Integer contactsCount = 0;
        @AuraEnabled
        public List<CloseContacts> contacts;
    }

    public class CloseContacts {
        @AuraEnabled
        public String id;
        @AuraEnabled
        public String token;
        @AuraEnabled
        public Date contactDate;
        @AuraEnabled
        public String status;
    }
}
