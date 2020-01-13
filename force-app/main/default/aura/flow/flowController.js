({
    myAction : function(component, event, helper) {

    },
    handleClick : function(component, event, helper) {
        console.log("submit");		 
        debugger;
        var action=component.get("c.update1");
        action.setParams({});	
        $A.enqueueAction(action);
         var response = event.getSource().getLocalId();
      component.set("v.value", response);
      var navigate = component.get("v.navigateFlow");
      navigate("NEXT");
   }
})
