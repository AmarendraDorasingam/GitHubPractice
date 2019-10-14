public class amartest {
    public  void getuser(){
        list<case> cases =[select id,CaseNumber,(select Serviceappointments__r.Name,Serviceappointments__r.owner.id 
                                                 from workorders__r where Serviceappointments__r.owner.id = :userinfo.getUserId() ) 
                           from case  ];
        list<case> newcases = new list<case>();
        for (case c: cases)
        {    
          // System.debug('Case Number ' + c.CaseNumber);      
    	   if(c.workorders__r != null && c.workorders__r.size() > 0){
              newcases.add(c);
            }
        }
        
        for(case c:newcases)
          System.debug('Case Number ' + c.CaseNumber);  
        
    }
}