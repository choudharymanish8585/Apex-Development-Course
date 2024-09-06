// Example 1: Car with a valid Engine
Car carWithEngine = new Car();
carWithEngine.model = 'Land Rover Discovery';
carWithEngine.engine = new Car.Engine();
carWithEngine.engine.horsepower = 300;
carWithEngine.engine.make = 2016;

System.debug('Car Model: ' + carWithEngine?.model);
System.debug('Car Engine HP: ' + carWithEngine?.engine?.horsepower);

// Example 2: Car without an Engine (engine is null)
Car carWithoutEngine = new Car();
carWithoutEngine.model = 'Land Rover Defender';
System.debug('Car Model: ' + carWithoutEngine?.model);
System.debug('Car Engine HP: ' + carWithoutEngine?.engine?.horsepower);

// Example 3: Null Car
Car nullCar = null;
System.debug('Car Model: ' + nullCar?.model);
System.debug('Car Engine HP: ' + nullCar?.engine?.horsepower); */




/* for (People_Tracing__c ppl : [
    SELECT
        Id,
        Person_1__c,
        Person_1__r.Health_Status__c,
        Person_1__r.Name,
        Person_1__r.Status_Update_Date__c
    FROM People_Tracing__c
]) {
    System.debug(
        'Person 1 - First Name: ' + ppl.Person_1__r.Name?.split(' ')?.get(0)
    );
    System.debug(
        'Person 1 - Health Status: ' + ppl.Person_1__r.Health_Status__c
    );
    System.debug(
        'Person 1 - Status Update Date: ' +
            ppl.Person_1__r.Status_Update_Date__c?.daysBetween(Date.today()) +
            ' ago'
    );
} */