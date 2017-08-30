import VPlay 2.0
import QtQuick 2.0
import "../common"

Scene {
    id: menuScene

    signal signalLevelSelect

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

        Rectangle { height: 40; width: 40; opacity: 0; anchors.horizontalCenter: parent.horizontalCenter }

        ButtonMenu {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Level Select"
            onClicked: {
                signalLevelSelect()
            }
        }

        ButtonMenu {
            id: buttonBGM
            anchors.horizontalCenter: parent.horizontalCenter
            text: if (bgm.boolMuted === false) {"Music is On"} else {"Music is Off"}
            onClicked: bgm.mute()
        }

        SliderVPlay {
            id: sliderBGM
            anchors.left: buttonBGM.left
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.right: buttonBGM.right
            maximumValue: 1.0
            minimumValue: 0.0
            value: bgm.realVolume
            onValueChanged: { bgm.realVolume = value; bgm.adjustVolume() }
        }

        ButtonMenu {
            id: buttonSFX
            anchors.horizontalCenter: parent.horizontalCenter
            text: if (sfx.boolMuted === false) {"Sound is On"} else {"Sound is Off"}
            onClicked: sfx.mute()
        }

        SliderVPlay {
            id: sliderSFX
            anchors.left: buttonSFX.left
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.right: buttonSFX.right
            maximumValue: 1.0
            minimumValue: 0.0
            value: sfx.realVolume
            onValueChanged: { sfx.realVolume = value; sfx.adjustVolume() }
        }
    }
}
