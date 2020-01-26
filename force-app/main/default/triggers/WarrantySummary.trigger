trigger WarrantySummary on Case (before insert) {

    for(Case myCase : Trigger.new)
    {

        String purchaseDate = myCase.Product_Purchase_Date__c.format();
        String createdDate = Datetime.now().format();
        Decimal warrantyDays = myCase.Product_Total_Warranty_Days__c;
        Decimal warrantyPercentage = (100 * (myCase.Product_Purchase_Date__c.daysBetween(Date.today()) 
                                     / warrantyDays)).setscale(2);
        Boolean hasExtendedWarranty = myCase.Product_Has_Externded_Warranty__c;

        myCase.Warranty_Summary__c = 'Product purchased on ' + purchaseDate + '\n'
                                + 'and case created on '  + createdDate + '\n'
                                + 'Warranty is for ' + warrantyDays + '\n'
                                + 'and is' + warrantyPercentage + ' % through its warranty period.\n'
                                + 'Extended warranty:' + hasExtendedWarranty + '\n'
                                + 'Have a nice day!';
    
    }
}