({
    clickCreateItem: function(component, event, helper) {
        var validItem = component.find('itemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validItem){
            // Create the new expense

            
        var theitems = component.get("v.newItem");
        var newItem = JSON.parse(JSON.stringify(theitems));
 
        theitems.push(newItem);
        component.set("v.items", theitems);
            
            
        }
    }
})