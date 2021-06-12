({
    fetchUserInformation: function (component) {
        //Method definition goes here
        const recordId = component.get("v.recordId");
        const action = component.get("c.getPersonDetails");
        action.setParams({
            recordId
        });
        action.setCallback(this, function (response) {
            const state = response.getState();
            if (state === "SUCCESS") {
                const resp = response.getReturnValue();
                // check if user found
                if (!resp || !resp.name) {
                    // user not found
                    component.set("v.userFound", false);
                    this.showToast("ERROR", "Please enter valid user id", "error");
                } else {
                    // user found
                    component.set("v.userFound", true);
                    component.set("v.userInfo", resp);
                }
            } else {
                component.set("v.userFound", false);
                this.showToast("ERROR", "Please enter valid user id", "error");
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
