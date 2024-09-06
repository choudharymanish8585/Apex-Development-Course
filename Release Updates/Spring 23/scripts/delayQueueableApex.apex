LeadQueueable lq = new LeadQueueable();
Integer delayInMinutes = 2; //2 min delay
System.debug('Enqueueing the job at: ' + Datetime.now());
System.enqueueJob(lq, 2);

//Code reset Lead records for multiple time testing
/* List<Lead> ll = [SELECT id, leadsource FROM lead WHERE isconverted = FALSE];
for (Integer i = 0; i < ll.size(); i++) {
    if (Math.mod(i, 5) == 0) {
        ll[i].leadsource = 'Web';
    }
    if (Math.mod(i, 5) == 1) {
        ll[i].leadsource = 'Other';
    }
    if (Math.mod(i, 5) == 2) {
        ll[i].leadsource = 'Phone Inquiry';
    }
    if (Math.mod(i, 5) == 3) {
        ll[i].leadsource = 'Partner Referral';
    }
    if (Math.mod(i, 5) == 4) {
        ll[i].leadsource = 'Purchased List';
    }
}
update ll; */

