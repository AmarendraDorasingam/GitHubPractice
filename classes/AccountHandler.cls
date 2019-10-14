public class AccountHandler {

    public static Account insertNewAccount (String accName){
          
            try{
                Account asd = new Account(Name=accName);
                insert asd;
                return asd;
            } catch(Exception e){
                return null;
            }
        
    }
    
}