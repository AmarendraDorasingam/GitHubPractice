public class AccountUtils {

    public static list<account> accountsByState (String status )
    {
        list<account> accdetails = [select id, Name from Account where billingstate =:status];
        return accdetails;
        
    }
    
    
}