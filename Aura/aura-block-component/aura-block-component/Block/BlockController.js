({
    blockClickHandler: function (component, event, helper) {
        const open = component.get("v.open");
        if (!open) {
            component.set("v.open", true);
        }
    }
});
