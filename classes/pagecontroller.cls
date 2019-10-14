public class pagecontroller {
    public string s {get;set;}
    public pagecontroller(){
      s= 'SACHIN';
    }
    public PageReference testaction() {
       // pagereference p=new pagereference('/apex/policy');
       if(s==null)
       s='not cons';
        s=s+' action method';
        return null;
        
    }

}