public class Todaysplus5 {
   public Datetime todate1{get;set;}
   Public string[] resultdates {get;set;}

   
    public String[] getBusinessday()
    {
        resultdates = new String[]{};
        DateTime myDateTime=(DateTime) System.today();
        for(integer i =0;i<10;i++)
        {
  
           /*IF(myDateTime.format('E')=='SAT')
           myDateTime = myDateTime+2;
           ELSE IF(myDateTime.format('E')=='FRI')
           myDateTime = myDateTime+3;
           ELSE
           myDateTime = myDateTime+1;*/
           
           resultdates.add(myDateTime.format('EEEE')+'    '+myDateTime);
           
        }    
        return resultdates;
    }
}