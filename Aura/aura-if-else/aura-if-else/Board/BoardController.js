({
    doInit: function (component, event, helper) {
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
    },

    doRender: function (component, event, helper) {
        console.log("Render completed");
    }
});
