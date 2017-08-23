import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: entityBase

    width: 32
    height: 32
    x: 160
    y: 240
    z: 3 //Game object

    property alias imageSrc: boxImage.source
    property alias movementEntity: moveEntity

    BoxCollider {
        id: boxCollider
        bodyType: Body.Dynamic
        x: -width/2
        y: -height/2
    }

    Image {
        id: boxImage
        anchors.fill: boxCollider
    }

    MouseArea {
        id: mouseArea
        anchors.fill: boxCollider
        onClicked: {
            pointScore2 = textScore.text
            textScore.text = (pointScore + pointScore2).toString()
            parent.removeEntity()
        }
    }

    Timer {
        id: moveEntity
        running: true
        repeat: true
        interval: 75

        onTriggered: {
            if (parent.horizontalAxis === true) { parent.x += parent.horizontalSpeed / 15 }
            if (parent.horizontalAxis === false) { parent.x -= parent.horizontalSpeed / 15 }
            if (parent.verticalAxis === true) { parent.y += parent.verticalSpeed / 15 }
            if (parent.verticalAxis === false) { parent.y -= parent.verticalSpeed / 15 }

            if (parent.x >= 320) {parent.removeEntity()}
            if (parent.x <= 0) {parent.removeEntity()}
            if (parent.y >= 355) {parent.removeEntity()}
            if (parent.y <= 0) {parent.removeEntity()}
        }
    }
}
