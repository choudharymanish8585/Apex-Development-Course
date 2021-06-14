/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 06-15-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log
 * Ver   Date         Author                               Modification
 * 1.0   06-15-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
 **/
public with sharing class CTStatusUpdateSchedule implements Schedulable {
    public static final String CRON = '0 0 3 * * ?';
    public void execute(SchedulableContext sc) {
        CTUpdatePersonStatusBatch updatePersonStatusBatch = new CTUpdatePersonStatusBatch();
        Database.executeBatch(updatePersonStatusBatch, 2000);

        CTLocationStatusUpdateBatch updateLocationStatusBatch = new CTLocationStatusUpdateBatch();
        Database.executeBatch(updateLocationStatusBatch, 2000);
    }
}
