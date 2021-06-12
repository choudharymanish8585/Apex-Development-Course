({
    doInit: function (component, event, helper) {
        const columns = [
            { label: "Token", fieldName: "token", type: "text" },
            { label: "Contact Status", fieldName: "status", type: "text" },
            { label: "Visit Date", fieldName: "visitDate", type: "date" }
        ];
        component.set("v.columns", columns);
    },

    locationSearchHandler: function (component, event, helper) {
        //Method definition goes here
        helper.fetchLocationInformation(component);
    }
});
