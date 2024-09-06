public with sharing class AccountTriggerHandler {
    public static void afterUpdateHandler(List<Account> accs) {
        for (Opportunity opp : [
            SELECT Id, Name, Amount
            FROM Opportunity
            WHERE AccountId IN :accs
        ]) {
            System.debug('Opp Id: ' + opp.Id);
            System.debug('Opp Name: ' + opp.Name);
            System.debug('Opp Amount: ' + opp.Amount);
        }

        List<Opportunity> oppsToInsert = new List<Opportunity>();
        for (Account acc : accs) {
            if (acc.Type == 'Customer - Direct') {
                oppsToInsert.add(
                    new Opportunity(
                        Name = 'Direct Customer Opp -' + acc.Name,
                        Amount = 100000,
                        AccountId = acc.Id,
                        StageName = 'Prospecting',
                        CloseDate = Date.today()
                    )
                );
            }
        }
        insert oppsToInsert;

        List<Opportunity> opps = Database.query(
            'SELECT Id, Name, Amount FROM Opportunity WHERE AccountId IN :accs',
            AccessLevel.USER_MODE
        );
        for (Opportunity opp : opps) {
            System.debug('Database Query Opp Id: ' + opp.Id);
            System.debug('Database Query Opp Name: ' + opp.Name);
            System.debug('Database Query Opp Amount: ' + opp.Amount);
        }
    }
}
