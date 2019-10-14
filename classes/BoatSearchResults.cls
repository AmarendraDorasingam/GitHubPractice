public class BoatSearchResults 
{
    @AuraEnabled
    public static List<Boat__c> getBoats(string boatTypeId)
    {
        return [SELECT Id, Name from Boat__c WHERE BoatType__c = :boatTypeId ORDER BY Name];
    }
}