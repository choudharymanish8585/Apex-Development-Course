public with sharing class BoardPanelController {
    @AuraEnabled
    public static String addResult(String result, String mode) {
        Word_Shuffle__c gameResult = new Word_Shuffle__c(Result__c = result, Mode__c = mode);
        insert gameResult;
        return 'success';
    }
}
