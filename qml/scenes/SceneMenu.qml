import VPlay 2.0
import QtQuick 2.0
import "../common"

Scene {
    id: menuScene

    signal signalNewGame

    Rectangle {
        z: 0 //background
        anchors.fill: parent.gameWindowAnchorItem
        color: "#47688e"
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        z: 6 //UI
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Main Menu"
    }

    Column {
        anchors.centerIn: parent
        spacing: 10
        MenuButton {
            text: "New Game"
            onClicked: signalNewGame()
        }
    }
}
