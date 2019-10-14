@istest
public class schedulertest{
    
    public static testmethod void testSchemaExtract(){
        SchemaExtractController controller = new SchemaExtractController();
        List<SelectOption> tt = controller.ObjectList;
        string tmp = controller.AuthToken;
        controller.AuthToken = 'bad'; 
        controller.getSpreadSheets(); 
        controller.extractMore();
        controller.continuePage();
       system.assertequals(tmp,controller.AuthToken,'sucess');
    }
}