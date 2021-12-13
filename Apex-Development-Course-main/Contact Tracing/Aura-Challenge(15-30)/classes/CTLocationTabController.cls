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
public with sharing class CTLocationTabController {
    @AuraEnabled
    public static LocationInformation getLocationDetails(String recordId) {
        LocationInformation info = new LocationInformation();

        Location__c location = CTLocationController.getLocationById(recordId);
        if (location != null) {
            info.name = location.Name;
            info.redScore = Integer.valueOf(location.Red_Score__c);
            info.statusUpdateOn = location.Status_Update_Date__c;
            info.pinCode = location.Pincode__c;
            info.status = location.Status__c;
        }

        List<Location_Tracing__c> traces = CTLocationTracingController.getVistors(recordId);

        if (traces != null && traces.size() > 0) {
            List<CloseContacts> closeContacts = new List<CloseContacts>();

            for (Location_Tracing__c trace : traces) {
                CloseContacts cc = new CloseContacts();
                cc.id = trace.Person__c;
                cc.status = trace.Person__r.Health_Status__c;
                cc.token = trace.Person__r.Token__c;
                cc.visitDate = trace.Visit_Date__c;
                closeContacts.add(cc);
            }

            info.contacts = closeContacts;
            info.contactsCount = closeContacts.size();
        }
        return info;
    }

    public class LocationInformation {
        @AuraEnabled
        public String name;
        @AuraEnabled
        public Integer redScore;
        @AuraEnabled
        public Date statusUpdateOn;
        @AuraEnabled
        public String pinCode;
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
        public Date visitDate;
        @AuraEnabled
        public String status;
    }
}
