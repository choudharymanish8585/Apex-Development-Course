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
public with sharing class CTHealthHeaderController {
    
    @AuraEnabled
    public static Map<String, Integer> getPersonHealthStatuscount(){
        return CTPersonController.getHealthStatusCount();
    }

    @AuraEnabled
    public static Map<String, Integer> getLocationHealthStatuscount(){
        return CTLocationController.getHealthStatusCount();
    }
}
