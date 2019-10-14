trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
list<BatchLeadConvertErrors__c> Blead = new list<BatchLeadConvertErrors__c>();
for(BatchApexErrorEvent  b: trigger.new)
{ BatchLeadConvertErrors__c bl =new BatchLeadConvertErrors__c();
  bl.AsyncApexJobId__c = b.AsyncApexJobId;
  bl.Records__c = b.JobScope;
  bl.StackTrace__c   = b.StackTrace;
  blead.add(bl);
}
database.insert(blead);
}