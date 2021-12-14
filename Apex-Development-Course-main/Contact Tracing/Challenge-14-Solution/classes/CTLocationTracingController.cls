/**
 * CTLocationTracingController
 * Main controller class for Location_Tracing__c object
 * @author Manish
 */
public with sharing class CTLocationTracingController {

    /**
     * Get last 30 days visitors
     * @param locationId
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getVistors(String locationId){
        return [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Token__c, Person__r.Health_Status__c 
                    FROM Location_Tracing__c 
                    WHERE Id =: locationId
                    ORDER BY Visit_Date__c DESC ];
    }

    /**
     * Get all location ids for visitors
     * @param personIds
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getLocationsByPersonIds(Set<Id> personIds){
        return [SELECT Id, Person__c, Location__c 
                FROM Location_Tracing__c 
                WHERE Person__c IN :personIds
                AND Visit_Date__c = LAST_N_DAYS:10];
    }

    /**
     * Get all visitor ids for locations
     * @param locationIds
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
        return [SELECT Id, Person__c, Location__c 
                FROM Location_Tracing__c 
                WHERE Location__c IN :locationIds
                AND Person__r.Health_Status__c = 'Green'
                AND Visit_Date__c = LAST_N_DAYS:10];
    }


    public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newLocationTraces){
        // store unique location ids
        Set<Id> locationIds = new Set<Id>();
        // store unique person Ids
        Set<Id> personIds = new Set<Id>();
        for (Location_Tracing__c trace : newLocationTraces) {
            locationIds.add(trace.Location__c);
            personIds.add(trace.Person__c);
        }

        // map of location id, set of person ids
        Map<Id, Set<Id>> mapOfExistingRecords = new Map<Id, Set<Id>>();
        // location1, [person1, person2]
        // query existing location tracing records
        List<Location_Tracing__c> existingRecords = [SELECT Id, Person__c, Location__c 
                                                        FROM Location_Tracing__c 
                                                        WHERE Location__c IN :locationIds
                                                        AND Person__c IN :personIds];

        // list of duplicate records
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();


        if(existingRecords != null && existingRecords.size() > 0){
            for (Location_Tracing__c trace : existingRecords) {
                if(! mapOfExistingRecords.containsKey(trace.Location__c)){
                    mapOfExistingRecords.put(trace.Location__c, new Set<Id>());
                }
                // add person ids to map set
                mapOfExistingRecords.get(trace.Location__c).add(trace.Person__c);
            }
            
            // loop over new location tracing records
            for (Location_Tracing__c trace : newLocationTraces) {
                // first check for location id
                // if item found in map, then check for person in set
                if(mapOfExistingRecords.containsKey(trace.Location__c) 
                    && mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c)){
                        duplicates.add(trace);
                }
            }
        }

        return duplicates;
    }
}
