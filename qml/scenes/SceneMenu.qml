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

    Column {
        anchors.centerIn: parent
        spacing: 10

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

        Rectangle { height: 40; width: 40; opacity: 0 }

        Row {
            height: 30
            spacing: 10

            MenuButton {
                text: "Level 01"
                onClicked: {
                    currentLevel.setLevel(1)
                    signalNewGame()
                }
            }

            MenuButton {
                text: "Level 02"
                onClicked: {
                    currentLevel.setLevel(2)
                    signalNewGame()
                }
            }
        }

        Row {
            height: 30
            spacing: 10

            MenuButton {
                text: "Level 03"
                onClicked: {
                    currentLevel.setLevel(3)
                    signalNewGame()
                }
            }

            MenuButton {
                text: "Level 04"
                onClicked: {
                    currentLevel.setLevel(4)
                    signalNewGame()
                }
            }
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
