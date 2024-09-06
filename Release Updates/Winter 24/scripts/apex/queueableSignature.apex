AsyncOptions options = new AsyncOptions();

options.DuplicateSignature = QueueableDuplicateSignature.Builder().addId(UserInfo.getUserId()).addString('LeadQueueable').build();

// Enqueueing for first time
System.enqueueJob(new LeadQueueable(), options);
// Enqueueing for 2nd time with same signature
//System.enqueueJob(new LeadQueueable(), options);

options.DuplicateSignature = QueueableDuplicateSignature.Builder().addId(UserInfo.getUserId()).addString('LeadQueueable').addInteger(1).build();
// Enqueueing for 2nd time with diff signature
System.enqueueJob(new LeadQueueable(), options);
