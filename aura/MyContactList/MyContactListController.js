({
	myAction : function(component, event, helper) {
		var action = component.get("c.getContacts");
action.setCallback(this, function(data) {
component.set("v.contacts", data.getReturnValue());
    component.set("v.Columns", [
    {label:"First Name", fieldName:"FirstName", type:"text"},
    {label:"Last Name", fieldName:"LastName", type:"text"},
    {label:"Phone", fieldName:"Phone", type:"phone"}
]);

});
$A.enqueueAction(action);
	}
})