public class futuremessage {

 @future
 public static void sentmail(integer ab){
     Messaging.reserveSingleEmailCapacity(2);
     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
     String[] toAddresses = new String[] {'amarendra.001@gmail.com'}; 
     String[] ccAddresses = new String[] {'amar_mca_aits@yahoo.co.in'};
     mail.setToAddresses(toAddresses);
     mail.setCcAddresses(ccAddresses);
     mail.setReplyTo('amar_mca_aits@yahoo.co.in');
     mail.setSenderDisplayName('Amarendra Reddy D');
     mail.setSubject('New Job Created ans message sent through @future mul '+ab);
     mail.setBccSender(false);
     mail.setUseSignature(false);
     mail.setPlainTextBody('New Job Created ans message sent through @future method please have a look');
     mail.setHtmlBody('Your case:has been created'+ab);
     Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
          restcallout.call();  
}
}