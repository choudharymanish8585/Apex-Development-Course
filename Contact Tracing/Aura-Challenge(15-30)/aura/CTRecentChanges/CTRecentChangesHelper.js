({
    fetchRecentHealthChanges: function (component) {
        let action = component.get("v.scope") === "person" ? component.get("c.getRecentPersonHealthChanges") : component.get("c.getRecentLocationHealthChanges");

        action.setCallback(this, function (response) {
            const state = response.getState();

            if (state === "SUCCESS") {
                const data = response.getReturnValue();
                component.set("v.data", data);
                component.set("v.initialResponse", data);
            }
        });
        $A.enqueueAction(action);
    },

    searchRecord: function (component, queryTerm) {
        let action = component.get("v.scope") === "person" ? component.get("c.searchPeople") : component.get("c.searchLocation");
        action.setParams({
            searchTerm: queryTerm
        });

        action.setCallback(this, function (response) {
            const state = response.getState();

            if (state === "SUCCESS") {
                const data = response.getReturnValue();

                if (data && data.length > 0) {
                    component.set("v.data", data);
                }
                component.set("v.issearching", false);
            }
        });

        $A.enqueueAction(action);
    }
});
