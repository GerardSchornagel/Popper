import VPlay 2.0
import QtQuick 2.0
import "../entities"
import "../common"

SceneBase {
    id: sceneGame

    EntityManager {
        id: eManagerGame
        entityContainer: sceneGame
        dynamicCreationEntityList: [
            Qt.resolvedUrl("../entities/TargetRegular.qml"),
            Qt.resolvedUrl("../entities/TargetFast.qml"),
            Qt.resolvedUrl("../entities/TargetIrregular.qml")
        ]
    }

    Rectangle {
        id: background
        z: 0 //background
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#000000"
            }

            GradientStop {
                position: 0.5
                color: "#001985"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }

        }
        anchors.fill: parent
    }

    Image {
        id: cockpit
        x: 0
        y: 0
        anchors.fill: parent
        z: 4 //Game overlay
        visible: true
        source: "../../assets/img/cockpitEasy.png"
    }

    MenuButton {
        id: recRegular
        x: 8
        y: 417

        bgColor: "#ffffff"
        text: qsTr("Regular")
        fgColor: "#000000"
        onClicked: { eManagerGame.createEntityFromEntityTypeAndVariationType( {entityType: "regular"} ) }
    }

    MenuButton {
        id: recFast
        x: 113
        y: 417

        bgColor: "#ffffff"
        text: qsTr("Fast")
        fgColor: "#000000"
        onClicked: { eManagerGame.createEntityFromEntityTypeAndVariationType( {entityType: "fast"} ) }
    }

    MenuButton {
        id: recIrregular
        x: 218
        y: 417
        bgColor: "#ffffff"
        text: qsTr("Irregular")
        fgColor: "#000000"
        onClicked: { eManagerGame.createEntityFromEntityTypeAndVariationType( {entityType: "irregular"} ) }
    }

    MenuButton {
        id: recStart
        x: 8
        y: 8

        bgColor: "#ffffff"
        text: qsTr("Start")
        fgColor: "#000000"
        onClicked: { timerSpawn.running = true }
    }

    MenuButton {
        id: recStop
        x: 218
        y: 8

        bgColor: "#ffffff"
        text: qsTr("Stop")
        fgColor: "#000000"
        onClicked: { timerSpawn.running = false }
    }

    MenuButton {
        id: recMenu
        x: 114
        y: 41

        bgColor: "#ffffff"
        text: qsTr("Menu")
        fgColor: "#000000"
        onClicked: {
            timerSpawn.running = false
            backButtonPressed()
        }
    }

    Item {
        id: arrayChance
        property variant aEntityType: ["regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "fast", "irregular", "irregular", "irregular", "irregular", "irregular"] //70%regular 25%fast 5%irregular
    }

    Timer {
        id: timerSpawn
        running: false
        repeat: true
        interval: 1500

        onTriggered: {
            eManagerGame.createEntityFromEntityTypeAndVariationType({ entityType: arrayChance.aEntityType[Math.round((Math.random() * arrayChance.aEntityType.length))].toString() })
            interval = Math.floor((Math.random() * 1500) + 750)
        }
    }

    Text {
        id: textScore
        text: "0"
        font.pointSize: 16
        x: (parent.width / 2) - (width / 2)
        y: 8
        z: 5 //Game Notifications
        color: "#ff0000"
    }
}
