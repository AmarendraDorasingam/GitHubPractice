trigger ClosedOpportunityTrigger on Opportunity (before insert,before update) {
    list<task> tasklist = new list<task>();
 for(Opportunity o : trigger.new)
 {   
     IF(o.StageName == 'Closed Won')
     {
          task t= new task();
          t.Subject = 'Follow Up Test Task';
         tasklist.add(t);
     }
 }
    insert tasklist;
}