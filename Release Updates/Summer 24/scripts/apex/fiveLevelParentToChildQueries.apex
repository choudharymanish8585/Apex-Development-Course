List<Account> accounts = [
    SELECT
        Name,
        (
            SELECT
                LastName,
                (
                    SELECT
                        Subject,
                        (
                            SELECT CommentBody
                            FROM CaseComments
                        )
                    FROM Cases
                )
            FROM Contacts
        )
    FROM Account
];

System.debug('Accounts: ' + accounts);
