public with sharing class accountadd
{        
    public List<Account> Stdproduct{get;set;}
    public List<wrapper> wrapperList {get;set;}  
    public list<wrapper> SelectedprodList{get;set;} 
    public class wrapper
    {
        public Account cont{get;set;}
        public Boolean selected{get;set;}
        public integer quantity{get;set;}
        public wrapper(Account c)
        {
            cont = c;
            selected = false;
        } 
    }
    public  List<wrapper> getProdList()
    {        
        if((wrapperList == null) || (wrapperList.size() == 0))
        {                      
            wrapperList = new List<wrapper>();            
            Stdproduct = new  List<Account>([Select id, Name from Account]);           
            for(Account c :(List<Account>)Stdproduct)            
            {               
                wrapperList.add(new wrapper(c));
            }
        }             
        return wrapperList;
    }
    
    public PageReference AddQuantity()
    {   
        PageReference pageRef= new PageReference('/apex/AddQuantity');
        //pageRef.setredirect(false);        
        return pageRef;           
    }

    public list<wrapper> getSelectedproducts()
    {
        selectedprodList = new list<wrapper>();      
        for(wrapper cCon:getProdList())
        {            
            if(cCon.selected==true)  
            {                        
                selectedprodList.add(cCon);
            }                           
        }        
        return selectedprodList;           
    }        
}