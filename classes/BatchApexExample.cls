Public Class BatchApexExample Implements Database.batchable<Sobject>{

    public database.querylocator start(database.batchablecontext bc){
         
        return database.getquerylocator('select id, description from account');
    
    }
    public void execute(database.batchablecontext bc, list<account> acclist){
        
            for(Account a: acclist){
                
                a.description='BatchApex';
            }
            
            update acclist;
    
    }
    
    public void finish(database.batchablecontext bc){
    
    
    
    }

}