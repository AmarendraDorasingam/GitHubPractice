public class jobdetails {

    public list<job__c> jobdetails { get; set; }
    public id accid;
    public id jobid{get;set;}
    public list<selectoption> getAccounts() {
        list<selectoption> accounts = new list<selectoption>();
        list<account> acc = new list<account>([select id,name from account]);
        for(account a : acc)
        accounts.add(new SelectOption(a.id,a.name));
        return accounts; 
    }
    public list<job__c> Jobsinfo() {
      list<job__c> jobdetails = new list<job__c>([select Name,Job_Stage__c from job__c]); 
      return jobdetails;
    }
    
    public list<job__c> getJobsinfo() {
         list<job__c> jobdetails = new list<job__c>([select id,Name,Job_Stage__c,account_name__c  from job__c where account_name__c =:accid and account_name__c <> null]); 
      return jobdetails;
    }
    public id getacc_detail() {
       return accid;
    }
    public void setacc_detail(id accid) {
      this.accid= accid;
    }
   public PageReference apply() {
   PageReference  jobapp= new PageReference('/apex/jobapplicant?jobno='+jobid);
    jobapp.setredirect(true);
    return jobapp;
    }
}