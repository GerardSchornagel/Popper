import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: entityBase

    width: 32
    height: 32
    x: 160
    y: 240

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
            parent.visible = false
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
        }
    }

    Timer {
        id: retireEntity
        running: true
        repeat: false
        interval: 5500

        onTriggered: { parent.visible = false }
    }
}
