trigger LeadingCompetitor on Opportunity (before update) 
{
    List<Competitor__C> competitors = new List<Competitor__C>();

    for(Opportunity opp : Trigger.new)
    {
        String opportunityId = opp.Id;

        competitors = [SELECT Id, Name, BidPrice__c 
                       FROM Competitor__C 
                       //WHERE Opportunity__c = :opportunityId]; 
    
        system.debug(competitors);

        Boolean hasRunCompetitorsCheck = false;
        Decimal lowestBid = 0;
        String lowestBidder = '';

        for(Competitor__c competitor : competitors)
        {
            if(!hasRunCompetitorsCheck)
            {
                lowestBid = competitor.BidPrice__c;
                lowestBidder = competitor.Name;
                hasRunCompetitorsCheck = true;
                continue;
            }
            else 
            {
                if(lowestBid > competitor.BidPrice__c)
                {
                    lowestBid = competitor.BidPrice__c;
                    lowestBidder = competitor.Name;
                }
            }
        }

        opp.MainCompetitors__c	= lowestBidder;
        
    }
}