import VPlay 2.0
import QtQuick 2.0
import "../common"

TargetBase {
    entityType: "irregular"
    imageSrc: "../../assets/img/special.png"
    movementEntity.onTriggered: {
        if (Math.round(Math.random() * 100) > 75) {
            horizontalAxis = Math.round(Math.random())
            verticalAxis = Math.round(Math.random())
        } //Code is .added. to TargetBase.moveEntity.onTriggered
    }

    property int totalSpeed: Math.floor((Math.random() * 200) + 25) // Determine random speed for object.
    property int percentageAxis: Math.floor((Math.random() * 100) + 1) // Set a course with a random value between Horizontal and Vertical.

    property bool horizontalAxis: Math.round(Math.random()) // Randomly decide to go positive or negative on Axis.
    property bool verticalAxis: Math.round(Math.random()) // Randomly decide to go positive or negative on Axis.

    property int horizontalSpeed: (percentageAxis / 100) * totalSpeed // Match horizontalSpeed to percentageAxis.
    property int verticalSpeed: ((100 - percentageAxis) / 100) * totalSpeed // 100% minus percentageAxis makes the verticalSpeed.

    property int pointScore: Math.round(totalSpeed * 10) // Score based on speed of object.
    property int pointScore2: 0 // Used for adding current score with object score.
}
