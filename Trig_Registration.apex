trigger Trig_Registration on Registration__c (after insert, after update) {
    // Get all active automated sends first
    List<et4ae5__Automated_Send__c> automatedSends = [
        SELECT Id, Name, et4ae5__Active__c 
        FROM et4ae5__Automated_Send__c 
        WHERE et4ae5__Object__c = 'Registration__c' 
        AND et4ae5__Active__c = true
    ];
    
    // Then iterate through the results
    for(et4ae5__Automated_Send__c tsend: automatedSends) {
        et4ae5.triggerUtility.automateByName('Registration__c', tsend.Name);
    }
}
