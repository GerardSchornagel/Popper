import VPlay 2.0
import QtQuick 2.0
import "../entities"
import "../common"
import "../levels"

SceneBase {
    id: sceneGame

    signal gameWon

    property bool boolWeapon01: true
    property int intGoalValue: textGoalValue.text
    property int intScoreValue: textScoreValue.text

    onGameWon: {
        textScoreValue.text = "0"
        timerSpawn.stop()
        eManagerGame.removeAllEntities()
        backButtonPressed()
    }

    EntityManager {
        id: eManagerGame
        entityContainer: sceneGame
        dynamicCreationEntityList: [
            Qt.resolvedUrl("../entities/TargetRegular.qml"),
            Qt.resolvedUrl("../entities/TargetFast.qml"),
            Qt.resolvedUrl("../entities/TargetIrregular.qml")
        ]
    }

    MouseArea {
        id: mouseareaField
        anchors.fill: parent
        onClicked: {
            if (boolWeapon01 === true) {
                sfx.weaponFire01()
                timerWeapon01.running = true
            }
        }
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

    Row {
        id: rowScore

        anchors.top: parent.top
        height: 20
        spacing: 1
        z: 5

        Text {
            id: textScoreName
            text: "Score: "
            font.pointSize: 16
            font.bold: true
            color: "#ff0000"
        }

        Text {
            id: textScoreValue
            text: "0"
            font.pointSize: 16
            font.bold: true
            color: "#ff0000"
        }
    }

    Row {
        id: rowGoal

        anchors.top: rowScore.bottom
        height: 20
        spacing: 1
        z: 5

        Text {
            id: textGoalName
            text: "Goal: "
            font.pointSize: 16
            font.bold: true
            color: "#ff0000"
        }

        Text {
            id: textGoalValue
            text: currentLevel.intGoal
            font.pointSize: 16
            font.bold: true
            color: "#ff0000"
        }
    }

    Row {
        id: rowWeapons

        anchors.top: rowGoal.bottom
        height: 54
        spacing: 5
        z: 5

        Rectangle {
            id: recWeapon01

            height: 50
            width: 50
            border.color: "#000000"
            color: "#c71313"

            Text {
                id: textWeapon01
                anchors.centerIn: recWeapon01
                height: parent.height
                width: parent.width

                text: qsTr("01")
                color: "#FFFFFF"
                font.pointSize: 256
                minimumPixelSize: 10
                fontSizeMode: Text.Fit
            }
        }
    }

    Row {
        id: rowDevelop
        anchors.bottom: parent.bottom
        spacing: 2
        z: 6//UI

        ButtonMenu {
            id: recStart

            bgColor: "#ffffff"
            text: qsTr("Start")
            fgColor: "#000000"
            onClicked: { timerSpawn.running = true }
        }


        ButtonMenu {
            id: recStop

            bgColor: "#ffffff"
            text: qsTr("Stop")
            fgColor: "#000000"
            onClicked: {timerSpawn.running = false}
        }

        ButtonMenu {
            id: recMenu

            bgColor: "#ffffff"
            text: qsTr("Menu")
            fgColor: "#000000"
            onClicked: {
                timerSpawn.running = false
                eManagerGame.removeAllEntities()
                backButtonPressed()
            }
        }

    }

    Row {
        id: rowSpawn

        anchors.bottom: rowDevelop.top
        spacing: 2
        z: 6//UI
        visible: false

        ButtonMenu {
            id: recRegular

            bgColor: "#ffffff"
            text: qsTr("Regular")
            fgColor: "#000000"
            onClicked: { eManagerGame.createEntityFromEntityTypeAndVariationType( {entityType: "regular"} ) }
        }

        ButtonMenu {
            id: recFast

            bgColor: "#ffffff"
            text: qsTr("Fast")
            fgColor: "#000000"
            onClicked: { eManagerGame.createEntityFromEntityTypeAndVariationType( {entityType: "fast"} ) }
        }

        ButtonMenu {
            id: recIrregular

            bgColor: "#ffffff"
            text: qsTr("Irregular")
            fgColor: "#000000"
            onClicked: { eManagerGame.createEntityFromEntityTypeAndVariationType( {entityType: "irregular"} ) }
        }
    }

    Timer {
        id: timerWeapon01
        running: false
        repeat: false
        interval: 1000

        onRunningChanged: {
            if (timerWeapon01.running === true) {
                recWeapon01.color = "#824141"
                boolWeapon01 = false
            }
        }

        onTriggered: {
            recWeapon01.color = "#c71313"
            boolWeapon01 = true
        }
    }

    Timer {
        id: timerSpawn
        running: false
        repeat: true
        interval: 1500

        onTriggered: {
            eManagerGame.createEntityFromEntityTypeAndVariationType({ entityType: currentLevel.arrayEncounters[Math.round((Math.random() * currentLevel.arrayEncounters.length))].toString() })
            interval = Math.floor((Math.random() * currentLevel.intSpeed) + 500)
        }
    }
}
