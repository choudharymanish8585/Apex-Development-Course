Map<String, Object> params = new Map<String, Object>{ 'source' => 'Web', 'industry' => 'Finance' };

String queryString = 'SELECT Id, Name, LeadSource, Industry FROM Lead WHERE LeadSource = :source AND Industry = :industry';

System.debug('LEAD RESULTS FROM DYANMIC QUERY WITH BINDS');
for (SObject lead : Database.queryWithBinds(queryString, params, AccessLevel.USER_MODE)) {
    System.debug('Lead: ' + lead);
}
