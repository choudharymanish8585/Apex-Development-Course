/**
 * AccountController Class
 * This class has helpful methods to work with Account object
 * */
public class AccountController {

    // Insert a list of account
    public static List<Account> insertAccounts(List<Account> accountToInsert){
        insert accountToInsert;
        return accountToInsert;
    }

    // Insert an account record
    public static Account insertAccount(Account accountToInsert){
        insert accountToInsert;
        return accountToInsert;
    }

    // Get all accounts
    public static List<Account> getAllAccounts(){
        // Retrieve all accounts and assign to a List collection
        List<Account> accounts = [SELECT Name, Phone FROM Account];
        return accounts;
    }


    // Print all accounts
    public static void printAllAccounts(){
        // Retrieve all accounts using getAllAccounts method
        List<Account> accounts = getAllAccounts();
        // iterate over all accounts and print account information
        for(Account account : accounts){
            System.debug('Account Name: '+account.Name+' Account Phone: '+account.Phone);
        }
    }

    public static Integer getAccountSize(){
        // Retrieve all accounts using getAllAccounts method
        List<Account> accounts = getAllAccounts();
        return accounts.size();
    }
}
