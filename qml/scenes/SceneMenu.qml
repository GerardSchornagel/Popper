import VPlay 2.0
import QtQuick 2.0
import "../common"

Scene {
    id: menuScene

    signal signalNewGame
    signal signalMusic
    signal signalSound


    Rectangle {
        z: 0 //background
        anchors.fill: parent.gameWindowAnchorItem
        color: "#47688e"
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        z: 6 //UI
        font.pixelSize: 36
        color: "#e9e9e9"
        text: "Popper V1.0.005"
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 72
        z: 6 //UI
        font.pixelSize: 28
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

        MenuButton {
            text: "Music On/Off"
            onClicked: signalMusic()
        }

        MenuButton {
            text: "Sound On/Off"
            onClicked: signalSound()
        }
    }
}
