import QtQuick 2.0
import VPlay 2.0
import "../common"

SceneBase {
    id: sceneLevelSelect

    signal signalNewGame

    Rectangle {
        z: 0 //background
        anchors.fill: parent.gameWindowAnchorItem
        color: "#47688e"
    }

    Grid {
        id: gridLevels
        anchors.fill: sceneLevelSelect
        spacing: 3
        rows: 4
        columns: 3

        ButtonSelect { id: button01; font.pixelSize: 32; font.bold: true; text: "01"
            onClicked: { currentLevel.setLevel(1); signalNewGame() }}
        ButtonSelect { id: button02; font.pixelSize: 32; font.bold: true; text: "02"
            onClicked: { currentLevel.setLevel(2); signalNewGame() }}
        ButtonSelect { id: button03; font.pixelSize: 32; font.bold: true; text: "03"
            onClicked: { currentLevel.setLevel(3); signalNewGame() }}

        ButtonSelect { id: button04; font.pixelSize: 32; font.bold: true; text: "04"
            onClicked: { currentLevel.setLevel(4); signalNewGame() }}
        ButtonSelect { id: button05; font.pixelSize: 32; font.bold: true; text: "N/A"}
        ButtonSelect { id: button06; font.pixelSize: 32; font.bold: true; text: "N/A"}
        ButtonSelect { id: button07; font.pixelSize: 32; font.bold: true; text: "N/A"}
        ButtonSelect { id: button08; font.pixelSize: 32; font.bold: true; text: "N/A"}
        ButtonSelect { id: button09; font.pixelSize: 32; font.bold: true; text: "N/A"}

        ButtonSelect { id: buttonBack; font.bold: true; text: "Menu"
            onClicked: backButtonPressed()}
    }
}
