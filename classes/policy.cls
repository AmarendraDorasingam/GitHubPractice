public with sharing class policy {
    public tfe_policy__c policy {get;set;}
    public policyline__c policyline{get;set;}
    private ApexPages.StandardController std;
    public policy(ApexPages.StandardController controller) {
     std=controller;
    }
     public tfe_policy__C getpolicy()
    {
     return (tfe_policy__C) std.getRecord();
    }
    public boolean inser()
    {  
       boolean result=true;
       //tfe_policy__c pp= new tfe_policy__c();
       //pp= [select id from tfe_policy__c where name = :policy.name limit 1];
       policyline__c pol = new policyline__c();
       pol.Name  = policyline.Name;
       pol.PolicyType__c = getpolicy().id;
      insert pol;
      return result;
    }

}