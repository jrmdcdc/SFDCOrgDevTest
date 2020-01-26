@isTest
public class AppleWatchTest1 {

    @isTest static void createOpportunity(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Opportunity 1';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount = 5000000;
        insert opp;
    }
    
}