trigger Trig_Registration on Registration__c (after insert, after update) {
    et4ae5.triggerUtility.automate('Registration__c'); 
   
}
