trigger Duplicate on Job__c (before insert,before update) {
  Map<String, Job__C> jobmap = new Map<String, Job__c>();
  
  for (Job__C job : Trigger.new) 
  {
    if ((job.Name != null) &&(Trigger.isInsert || (job.Name != System.Trigger.oldMap.get(job.Id).Name))) 
     jobMap.put(job.Name,job); 
     
/*BatchApexExample bt= new BatchApexExample();
database.executeBatch(bt);*/
     /*Messaging.reserveSingleEmailCapacity(12);
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
     String[] toAddresses = new String[] {'amarendra.001@gmail.com'}; 
     String[] ccAddresses = new String[] {'amar_mca_aits@yahoo.co.in'};
     mail.setToAddresses(toAddresses);
     mail.setCcAddresses(ccAddresses);
     mail.setReplyTo('amar_mca_aits@yahoo.co.in');
     mail.setSenderDisplayName('Amarendra Reddy D');
     mail.setSubject('New Job Created : ' + job.Id);
     mail.setBccSender(false);
     mail.setUseSignature(false);
     mail.setPlainTextBody('Your Job: ' + job.Id +' has been created.');
     mail.setHtmlBody('Your case:<b> ' + case.Id +' </b>has been created.<p>'+
     'To view your case <a href=https://sureamar-dev-ed.my.salesforce.com/'+job.Id+'>click here.</a>');

     Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });  */   
     //for(integer i=0;i<12;i++)
     
     /*futuremessage.sentmail(1);
     futuremessage.sentmail(2);
     futuremessage.sentmail(3);
     futuremessage.sentmail(4);
     futuremessage.sentmail(5);
     
     futuremessage.sentmail(6);
     futuremessage.sentmail(7);
     futuremessage.sentmail(8);
     futuremessage.sentmail(9);
     futuremessage.sentmail(10);
     futuremessage.sentmail(11);
     futuremessage.sentmail(12);
     futuremessage.sentmail(13);
     futuremessage.sentmail(14);
     futuremessage.sentmail(15);*/

  }
   
  for (Job__C job1 : [SELECT Name FROM Job__C WHERE Name IN :jobMap.KeySet()]) {
    Job__C newJob = jobMap.get(job1.Name);
    newJob.Name.adderror('A Job with this Name ' + newJob.Name+' already exists.');
}
}