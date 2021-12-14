({
    addResultRecord: function (component, gameResult) {
        // create apex method call action
        const action = component.get("c.addResult");
        const modeValue = component.get("v.selectedMode").toUpperCase();
        // set parameters
        action.setParams({
            result: gameResult.toUpperCase(),
            mode: modeValue
        });
        // define a callback
        action.setCallback(this, function (response) {
            const state = response.getState();
            if (state !== "SUCCESS") {
                console.error("Error in saving record");
            }
        });
        // call apex method
        $A.enqueueAction(action);
    }
});
