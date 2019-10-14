public class AccountTriggerHandler {
    public static void CreateAccounts ( list<account> accounts)
    {
        for(account a:accounts)
        {
            if(a.Billingstate!= a.Shippingstate)
            {  
                a.Shippingstate = a.Billingstate;
             }
        }
    }

}