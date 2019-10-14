public with sharing class testii {

    public integer i =5;
    public testii()
    {
      System.debug('const '+i);
      i=10;
        System.debug('const end '+i);
    }
    public void getvalue()
    {
       i++;
       System.debug(i);
    }
}