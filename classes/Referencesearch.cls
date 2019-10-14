public class Referencesearch 
{


    public string inputValue{get;set;}
    public list<WrapperpaAccountList> wrapper{get;set;}
    public Referencesearch(ApexPages.StandardController controller)
   {
      wrapper = New list<WrapperpaAccountList>();
    }
   public void fetch()
  {
      account ac;
      try {
                  ac = [select Reference__c,Name,AccountNumber From Account Where Reference__c = :inputvalue LIMIT 1];
                  WrapperpaAccountList w= New WrapperpaAccountList(inputvalue,ac);
                  wrapper.add(w);         
           }
         Catch(QueryException e)
        {
            WrapperpaAccountList w= New WrapperpaAccountList(inputvalue+'- Not Found ',null);
            wrapper.add(w);
       }
  }
  public class WrapperpaAccountList
  {
      public String Reference{get;set;}
      public Account record{get;set;}
      public WrapperpaAccountList(String chek,Account j)
      {   Reference=chek;
            record=j;        
        }
   }   
}