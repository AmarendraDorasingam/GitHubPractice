public class jobapplicant {
    public job_applicant__c jobapp{get;set;}
    public  id jobid{get;set;}
    public jobapplicant(ApexPages.StandardController controller) {
     jobapp = (job_applicant__c) controller.getrecord();
     jobapp.job_no__c =(id) System.currentPageReference().getParameters().get('jobno');
     jobapp.stage__c = System.currentPageReference().getParameters().get('stage');
     jobapp.City__c= System.currentPageReference().getParameters().get('city');   
    }
   }