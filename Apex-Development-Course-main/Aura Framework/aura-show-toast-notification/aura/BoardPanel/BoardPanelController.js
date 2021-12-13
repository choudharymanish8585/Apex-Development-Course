({
    startGame: function (component, event, helper) {
        // access combobox
        let gameModeComboBox = component.find("gameMode");

        // access the value of combobox
        let selectedValue = gameModeComboBox.get("v.value");

        const selectedMode = component.get("v.selectedMode");
        // update selectedMode attribute
        component.set("v.selectedMode", selectedValue);
        if (selectedMode) {
            const boardComp = component.find("boardComp");
            // call aura method
            boardComp.startGame();
        }
    },

    reshuffleBoard: function (component, event, helper) {
        const boardComp = component.find("boardComp");
        boardComp.reshuffleBoard();
        component.set("v.reshuffleDisabled", true);
    },

    onResultHandler: function (component, event, helper) {
        const result = event.getParam("result");
        if (result === "win") {
            component.set("v.reshuffleDisabled", true);
            helper.showToast("YOU WIN", "Hooray!!", "success");
        } else {
            component.set("v.reshuffleDisabled", false);
            helper.showToast("YOU LOSE", "Reshuffle the board to keep playing", "error");
        }
        helper.addResultRecord(component, result);
    }
});
