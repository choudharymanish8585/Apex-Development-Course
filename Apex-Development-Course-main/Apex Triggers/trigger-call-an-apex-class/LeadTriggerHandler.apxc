public class LeadTriggerHandler {

    public static void beforeInsertHandler(List<Lead> newRecords){
        for(Lead leadRecord : newRecords){
            if(String.isBlank(leadRecord.LeadSource)){
                leadRecord.LeadSource = 'Other';
            }
            // validation rules on Industry fields
            if(String.isBlank(leadRecord.Industry)){
                leadRecord.addError('The industry field cannot be blank');
            }
        }
    }

    public static void afterInsertHandler(List<Lead> newRecords){
        List<Task> leadTasks = new List<Task>();
        for(Lead leadRecord : newRecords){
            // create a task
            Task leadTask = new Task(Subject='Follow up on Lead Status', WhoId=leadRecord.Id);
            leadTasks.add(leadTask);
        }
        insert leadTasks;

        // inserting another lead record
        // this will call the trigger recursively
        Lead anotherLead = new Lead(LastName='Test Lead Single', Status='Open - Not Contacted', Company='SFDCFacts', Industry='Finance');
        insert anotherLead;
    }

    public static void beforeUpdateHandler(List<Lead> newRecords, Map<Id, Lead> oldRecordsMap){
        for(Lead leadRecord : newRecords){
            if(String.isBlank(leadRecord.LeadSource)){
                leadRecord.LeadSource = 'Other';
            }
            if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && oldRecordsMap.get(leadRecord.Id).Status == 'Open - Not Contacted'){
                leadRecord.Status.addError('You cannot directly close an open lead record');
            }
        }
    }
}
