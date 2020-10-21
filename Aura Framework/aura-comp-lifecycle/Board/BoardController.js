({
    doInit: function (component, event, helper) {
        console.log("Initialiation completed");
        // build a list of 100 words
        console.log("Words: " + helper.getWords(6));
    },

    doRender: function (component, event, helper) {
        console.log("Render completed");
    }
});
