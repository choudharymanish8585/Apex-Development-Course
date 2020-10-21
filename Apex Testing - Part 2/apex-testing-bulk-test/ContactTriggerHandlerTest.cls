@isTest
public with sharing class ContactTriggerHandlerTest {
    @isTest
    public static void afterInsertHandlerTest1() {
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name = 'Test 1'));
        testAccounts.add(new Account(Name = 'Test 2'));

        insert testAccounts;

        List<Contact> testContacts = new List<Contact>();
        testContacts.add(new Contact(LastName = 'Test Contact 1', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 2', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 3', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 4', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 5', AccountId = testAccounts[1].Id));

        insert testContacts;

        List<Account> accs = [SELECT Id, Active_Contacts__c FROM Account];
        System.assertEquals(2, accs.size());
        System.assertEquals(null, accs[0].Active_Contacts__c);
        System.assertEquals(null, accs[1].Active_Contacts__c);

        List<Contact> allContacts = [SELECT Id FROM Contact];
        System.assertEquals(5, allContacts.size());
    }

    @isTest
    public static void afterInsertHandlerTest2() {
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name = 'Test 1'));
        testAccounts.add(new Account(Name = 'Test 2'));

        insert testAccounts;

        List<Contact> testContacts = new List<Contact>();
        testContacts.add(new Contact(LastName = 'Test Contact 1', AccountId = testAccounts[0].Id, Active__c = true));
        testContacts.add(new Contact(LastName = 'Test Contact 2', AccountId = testAccounts[0].Id, Active__c = true));
        testContacts.add(new Contact(LastName = 'Test Contact 3', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 4', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 5', AccountId = testAccounts[1].Id));

        insert testContacts;

        List<Account> accs = [SELECT Id, Name, Active_Contacts__c FROM Account];
        System.assertEquals(2, accs.size());
        for (Account acc : accs) {
            if (acc.Name == 'Test 1') {
                System.assertEquals(2, acc.Active_Contacts__c);
            }
            if (acc.Name == 'Test 2') {
                System.assertEquals(null, acc.Active_Contacts__c);
            }
        }

        List<Contact> allContacts = [SELECT Id FROM Contact];
        System.assertEquals(5, allContacts.size());
    }

    @isTest
    public static void afterInsertHandlerTestBulk() {
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name = 'Test 1'));
        testAccounts.add(new Account(Name = 'Test 2'));

        insert testAccounts;

        List<Contact> testContacts = new List<Contact>();
        for (Integer i = 0; i < 1000; i++) {
            testContacts.add(new Contact(LastName = 'Test Contact ' + i, AccountId = testAccounts[0].Id, Active__c = true));
        }
        testContacts.add(new Contact(LastName = 'Test Contact Inactive 1', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact Inactive 2', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact Inactive 3', AccountId = testAccounts[1].Id));

        insert testContacts;

        List<Account> accs = [SELECT Id, Name, Active_Contacts__c FROM Account];
        System.assertEquals(2, accs.size());
        for (Account acc : accs) {
            if (acc.Name == 'Test 1') {
                System.assertEquals(1000, acc.Active_Contacts__c);
            }
            if (acc.Name == 'Test 2') {
                System.assertEquals(null, acc.Active_Contacts__c);
            }
        }

        List<Contact> allContacts = [SELECT Id FROM Contact];
        System.assertEquals(1003, allContacts.size());
    }
}
