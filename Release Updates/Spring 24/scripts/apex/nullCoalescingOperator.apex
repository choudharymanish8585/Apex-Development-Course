List<Opportunity> opps = [SELECT Id, Name, Description, Account.Website FROM Opportunity];
for (Opportunity opp : opps) {
    opp.Description = opp.Account.Website ?? 'Null coalescing demo';
}

update opps;
