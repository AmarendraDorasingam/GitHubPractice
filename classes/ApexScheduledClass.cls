Public class ApexScheduledClass Implements Schedulable
{
  public void execute(SchedulableContext sc)
  {
     sendmail();
  }
  public void sendmail()
  {
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    string [] toaddress= New string[]{'amarendra.001@gmail.com'};
    email.setSubject('Testing Apex Scheduler-Subject');
    email.setPlainTextBody('Testing Apex Scheduler-Body');
    email.setToAddresses(toaddress);
    Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
  }
}