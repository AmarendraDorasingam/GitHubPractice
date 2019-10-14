@RestResource(urlMapping='/showAccounts/*')
global with sharing class checkAccount{
 
    @HttpGet
    global static list<account> showAccount() {
      LIST<account> lst;
    try
    {
      lst= [select name,phone from Account]; 
      return lst;
    }
    catch(Exception ex)
    {
      system.debug('Error '+ex.getMessage());
    }
    return lst;  
    }
 
    global class MyUserDef1 {
        MyUserDef2 userDef2;
    }    
 
    global class MyUserDef2 {
        MyUserDef1 userDef1;
    }
    
}