public static void updateAvgCaseResolutionDays(List<Id> accountIds){
    Map<Id, Integer> accountTotalCaseMap = new Map<Id, Integer>();
    Map<Id, Integer> accountTotalCaseDaysMap = new Map<Id, Integer>();
    // retrive all the cases for all accounts
    // get resolution days for each account (ClosedDate - CreatedDate)
    for(Case caseObj : [SELECT Id, AccountId, CreatedDate, ClosedDate
                         FROM Case
                         WHERE IsClosed=true
                          AND AccountId IN :accountIds]){

        // if map does not have current account, then add it
        if(! accountTotalCaseMap.containsKey(caseObj.AccountId)){
            accountTotalCaseMap.put(caseObj.AccountId, 0);
            accountTotalCaseDaysMap.put(caseObj.AccountId, 0);
        }

        // increase number of cases
        Integer totalCases = accountTotalCaseMap.get(caseObj.AccountId);
        accountTotalCaseMap.put(caseObj.AccountId, totalCases+1);

        // get duration in days and add it to totalDays
        Integer totalDays = accountTotalCaseDaysMap.get(caseObj.AccountId);
        accountTotalCaseDaysMap.put(caseObj.AccountId, totalDays+caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date()));
    }
    // list of accounts to update
    List<Account> accountsToUpdate = new List<Account>();

    // iterate over the map to update all accounts
    for(Id accountId : accountTotalCaseMap.keySet()){
        Decimal resolutionDays = accountTotalCaseDaysMap.get(accountId)/accountTotalCaseMap.get(accountId);
        // update account object
        accountsToUpdate.add(new Account(Id=accountId, Avg_Case_Resolution_Days__c = resolutionDays));
    }
    update accountsToUpdate;
}
