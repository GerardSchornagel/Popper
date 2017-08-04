import VPlay 2.0
import QtQuick 2.0

GameWindow {
    id: gameWindow
    activeScene: scene
    licenseKey: "B1B5E382608982FB6A05595442BF9949D0A91C6097D27C8FE36BD049B5C1FDFDD2F56B8D5173E63B8F8374C2259D1B9970EBB1313083D64B1A0A280DA26323E4495F8FFC391BA39A70FCFE3288F4C752B10A4671C6F02B952B1B564DE77C76572B45B1EAFB6A839D8B3381B36BCD71A595E32158DF609770E83ECD1772F860F00A080FDDAA75D5ABCA92A6D7AF1F51A1768978F835DADC8891E50A4A79450C7A6CD2C6557750B002764FB13EAFD626A1F99596DFBCA1D32543A2278ACC6A0F07E08B1340D98BE95A22BA22F94EB4F78ABEBAEB9D514417FDC783D247ED95D3AC6F7C32E52388BDD4F12369BF2BFEF57BCBEF5C1F4BFC35F60E3C445ABB139F465C4CA48385BD7A38812E38C6DC964BB85FE26323C880147928AE1B1A272ABAE97C84B460A49F682B5940DA50DE490E02"

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
