import VPlay 2.0
import QtQuick 2.0

GameWindow {
    id: gameWindow
    activeScene: scene
    //licenseKey: "<generate one from https://v-play.net/licenseKey>"
    screenWidth: 640
    screenHeight: 960

    Component   {
        id: componentEntities

        EntityBase {
            entityType: "1"

            width: 32
            height: 32
            x: 160
            y: 240

            property int horizontalSpeed: Math.floor((Math.random() * 90) + 1)
            property bool horizontalAxis: Math.round(Math.random())
            property int verticalSpeed: Math.floor((Math.random() * 90) + 1)
            property bool verticalAxis: Math.round(Math.random())
            property int totalSpeed: horizontalSpeed + verticalSpeed
            property int pointScore: Math.round(totalSpeed / 10)
            property int pointScore2: 0

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
                source: "../assets/img/target.png"
            }

            Timer {
                id: moveEntity
                running: true
                repeat: true
                interval: 100

                onTriggered: {
                    if (parent.horizontalAxis == true) { parent.x += parent.horizontalSpeed / 10 }
                    if (parent.horizontalAxis == false) { parent.x -= parent.horizontalSpeed / 10 }
                    if (parent.verticalAxis == true) { parent.y += parent.verticalSpeed / 10 }
                    if (parent.verticalAxis == false) { parent.y -= parent.verticalSpeed / 10 }
                }
            }
        }
    }

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false
        updatesPerSecondForPhysics: 60
        velocityIterations: 5
        positionIterations: 5

        EntityManager{
            id: entityManager
            entityContainer: scene
            dynamicCreationEntityList: [componentEntities]
        }
    }

    Scene {
        id: scene
        width: 320
        height: 480

        Rectangle {
            id: background
            anchors.fill: parent
            color: "#C0C0C0"
        }

        Timer {
            id: timerSpawn
            running: true
            repeat: true
            interval: Math.floor((Math.random() * 3000) + 1)

            onTriggered: {
                entityManager.createEntityFromEntityTypeAndVariationType( {entityType: "1"} )            }
        }

        Text {
            id: textScore
            text: "0"
            x: (parent.width / 2) - (width / 2)

        }
    }
}
