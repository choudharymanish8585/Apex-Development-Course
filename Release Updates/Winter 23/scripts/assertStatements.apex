// check for equals
// Assert.areEqual('Expecting Manish', 'Got Choudhari', 'Name not equal'); // fail
Assert.areNotEqual('Expecting Manish', 'Got Choudhari'); // success

// check for boolean
Assert.isTrue(1 == 2); // fail
Assert.isFalse(1 == 2); // success

// check for null
Assert.isNull(null); // success
Assert.isNotNull(null); //fail

// check for instance type
Account acc = new Account();
Assert.isInstanceOfType(acc, Account.class); // success
Assert.isNotInstanceOfType(acc, Account.class); // fail
