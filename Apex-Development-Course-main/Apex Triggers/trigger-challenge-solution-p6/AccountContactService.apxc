public with sharing class AccountContactService {
    public static void updateActiveContacts(Set<Id> accountIds) {
        // get aggregate result for all accounts
        List<AggregateResult> results = [
            SELECT AccountId, COUNT(Id) totalContacts
            FROM Contact
            WHERE Active__c = TRUE AND AccountId IN :accountIds
            GROUP BY AccountId
        ];
        // build final list of accounts to update
        List<Account> accountsToUpdate = new List<Account>();
        for (AggregateResult result : results) {
            // get account id and number of active contacts
            String accId = String.valueOf(result.get('AccountId'));
            Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
            // make sure you use Id feild in your account to update it
            Account acc = new Account(Id = accId, Active_Contacts__c = totalContacts);
            accountsToUpdate.add(acc);
        }
        // update the final list of account
        update accountsToUpdate;
    }
}
