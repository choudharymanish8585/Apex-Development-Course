({
    updateStatus: function (component) {
        const recordId = component.get("v.recordId");

        const action = component.get("c.updateHealthStatus");
        action.setParams({
            personId: recordId
        });

        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // Handle response here - response.getReturnValue();
                this.showToast("Success", "Person Health Status Updated", "success");
            }
        });
        $A.enqueueAction(action);
    },

    showToast: function (title, message, type) {
        //Method definition goes here
        const toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title,
            message,
            type
        });
        toastEvent.fire();
    }
});
