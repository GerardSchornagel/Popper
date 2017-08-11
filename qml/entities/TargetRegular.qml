import VPlay 2.0
import QtQuick 2.0

EntityBase {
    entityType: "regular"

    width: 32
    height: 32
    x: 160
    y: 240


    property int totalSpeed: Math.floor((Math.random() * 50) + 25) // Determine random speed for object.
    property int percentageAxis: Math.floor((Math.random() * 100) + 1) // Set a course with a random value between Horizontal and Vertical.

    property bool horizontalAxis: Math.round(Math.random()) // Randomly decide to go positive or negative on Axis.
    property bool verticalAxis: Math.round(Math.random()) // Randomly decide to go positive or negative on Axis.

    property int horizontalSpeed: (percentageAxis / 100) * totalSpeed // Match horizontalSpeed to percentageAxis.
    property int verticalSpeed: ((100 - percentageAxis) / 100) * totalSpeed // 100% minus percentageAxis makes the verticalSpeed.

    property int pointScore: Math.round(totalSpeed / 10) // Score based on speed of object.
    property int pointScore2: 0 // Used for adding current score with object score.

    BoxCollider {
        id: boxCollider
        bodyType: Body.Dynamic
        x: -width/2
        y: -height/2
    }

    MouseArea {
        id: mouseArea
        anchors.fill: boxCollider
        onClicked: {
            parent.pointScore2 = textScore.text
            textScore.text = (parent.pointScore + parent.pointScore2).toString()
            parent.visible = false
        }
    }

    Image {
        id: boxImage
        anchors.fill: boxCollider
        source: "../../assets/img/target.png"
    }

    Timer {
        id: moveEntity
        running: true
        repeat: true
        interval: 75

        onTriggered: {
            if (parent.horizontalAxis == true) { parent.x += parent.horizontalSpeed / 15 }
            if (parent.horizontalAxis == false) { parent.x -= parent.horizontalSpeed / 15 }
            if (parent.verticalAxis == true) { parent.y += parent.verticalSpeed / 15 }
            if (parent.verticalAxis == false) { parent.y -= parent.verticalSpeed / 15 }
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
