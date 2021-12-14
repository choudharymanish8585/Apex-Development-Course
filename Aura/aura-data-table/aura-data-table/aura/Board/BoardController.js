({
    doInit: function (component, event, helper) {
        console.log("Initialiation completed");
        // get game mode
        const gameMode = component.get("v.mode");
        let column = 0;
        // get number of columns based on game mode
        // double equals "1" == 1
        // triple equals 1 === 1
        if (gameMode && gameMode === "hard") {
            column = 6;
        } else if (gameMode === "medium") {
            column = 4;
        } else {
            column = 3;
        }

        // get block width/size
        let blockSize = 12 / column;
        component.set("v.blockSize", blockSize);
        // build a list of 100 words
        const words = helper.getWords(column * column);
        component.set("v.words", words);
        // get win word
        const winWord = helper.getWinWord(words);
        component.set("v.winWord", winWord);
        // reset the board
        helper.resetBoard(component);
    },

    doRender: function (component, event, helper) {
        console.log("Render completed");
    },

    blockClickHandler: function (component, event, helper) {
        let clickCount = component.get("v.clickCount") + 1;
        // get event value
        const value = event.getParam("value");

        if (value === component.get("v.winWord")) {
            // user has won
            component.set("v.result", "YOU WIN");
            console.log("You win");
            helper.disableBoard(component);
            helper.fireResultEvent("win");
        } else if (clickCount === 3) {
            // user lose
            component.set("v.result", "YOU LOSE");
            console.log("You lose");
            helper.disableBoard(component);
            helper.fireResultEvent("lose");
        }
        // set click count
        component.set("v.clickCount", clickCount);
    },

    reshuffleBoard: function (component, event, helper) {
        const words = component.get("v.words");
        const randomizedWords = helper.randomizeArray(words);
        component.set("v.words", randomizedWords);
        helper.resetBoard(component);
    }
});
