public class LeadBatch implements Database.Batchable<SObject> {

    /**
     * Start Method
     * Executes only once
     * Return batch scope or records
     * Can return upto 50 million records
     * */
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    /**
     * Execute Method
     * Executes for each batch/chunk of records
     * Must have void return type
     * Each execution will get new set of governor limits
     * */
    public void execute(Database.BatchableContext BC, List<Lead> scope){
        for(Lead leadRecord : scope){
			leadRecord.LeadSource = 'Web';
        }
        update scope;
    }

    /**
     * Finish Method
     * Executes only once
     * Called after all batches are processed
     * Can be used for post processing
     * */
    public void finish(Database.BatchableContext BC){
        System.debug('Batch finished');
    }

}
