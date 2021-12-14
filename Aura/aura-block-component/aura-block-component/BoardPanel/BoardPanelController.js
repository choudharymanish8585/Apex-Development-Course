({
    startGame: function (component, event, helper) {
        // access combobox
        let gameModeComboBox = component.find("gameMode");

        // access the value of combobox
        let selectedValue = gameModeComboBox.get("v.value");

        // update selectedMode attribute
        component.set("v.selectedMode", selectedValue);
    },

    reshuffleBoard: function (component, event, helper) {
        console.log("Reshuffle board is called");
    }
});
