@isTest
public class Trig_RegistrationTest {
    @testSetup
    static void createdata (){

    }
    @isTest
    static void dummymethod (){
        et4ae5__Automated_Send__c tsend = new et4ae5__Automated_Send__c(et4ae5__Object__c='Registration__c', et4ae5__Active__c=true, Name='TriggerSend1');
		insert tsend;
        
        Registration__c reg = new Registration__c(Status__c ='');
        insert reg;
    }
   
}
