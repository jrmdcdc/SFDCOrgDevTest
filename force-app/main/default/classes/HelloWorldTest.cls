@isTest
public class HelloWorldTest {

    @isTest static void updateLead(){
        Lead myLead = new Lead();
        myLead.FirstName = 'Jerome';
        myLead.LastName = 'Dela Cruz';
        myLead.Company = 'Infor';
        insert myLead;
        
        myLead.Company = 'InforPSSC';
        update myLead;
    }
}