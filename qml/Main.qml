import VPlay 2.0
import QtQuick 2.0
import "entities"

GameWindow {
    id: gameWindow
    activeScene: scene
    licenseKey: "CBB2C1E515EF777FE6D3579A7FF21F4331EBCAF8B76D8986405CEC5D4210FC5EE3D34A4D11841224B81686393E428B731D91BBE036699C6CCDD12107B80F0753E5E1129D70A8624106C2A15528E9E80CC50239A17DAA89FEBD86978F8B419649CB7E3AEFEC9EDF5574EA5FE651203086C3049131AC45351F445C6EA2127F53E344AD1F1378BA3394B9D081C5EF3868F655EDE0F854ABD63D313CF72E0BC1DF150E4AB6AB474C2F46CF7EB02D9B2A8F286CD680CF0D63313AB0144CD9FCCA5C7BA0A95489E439597FBD1510E0BDB4F4943425C829CF68D8D9708C9585AD0B148E68C8C5BB3101EB9976ACF73DAEE39D01C9EA79586EDF75FDCB5AE8A809ED1E789B11B6DE36EDF66B6945B51C8E91AB6425E8564183F3FDD236C4BC85BA699EE07D72E982581E3320F77268BCE8F59F83"

    screenWidth: 640
    screenHeight: 960

    PhysicsWorld {
        id: physicsWorld
        debugDrawVisible: false
        updatesPerSecondForPhysics: 60
        velocityIterations: 5
        positionIterations: 5

        EntityManager{
            id: entityManager
            entityContainer: scene
            dynamicCreationEntityList: [
                Qt.resolvedUrl("entities/TargetRegular.qml"),
                Qt.resolvedUrl("entities/TargetFast.qml"),
                Qt.resolvedUrl("entities/TargetIrregular.qml")
            ]
        }
    }

    Scene {
        id: scene
        width: 320
        height: 480

        Rectangle {
            id: background
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

            Rectangle {
                id: recRegular
                x: 8
                y: 417
                width: 94
                height: 55
                color: "#ffffff"
                border.width: 2
                border.color: "#435b12"

                Text {
                    id: txtLabelRegular
                    x: 0
                    y: 0
                    width: 94
                    height: 55
                    text: qsTr("Regular")
                    font.family: "Times New Roman"
                    fontSizeMode: Text.HorizontalFit
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 12
                }

                MouseArea {
                    id: clkRegular
                    width: parent.width
                    height: parent.height
                    onClicked: { entityManager.createEntityFromEntityTypeAndVariationType( {entityType: "regular"} ) }
                }
            }

            Rectangle {
                id: recFast
                x: 113
                y: 417
                width: 94
                height: 55
                color: "#ffffff"
                border.width: 2
                border.color: "#435b12"
                Text {
                    id: txtLabelFast
                    x: 0
                    y: 0
                    width: 94
                    height: 55
                    text: qsTr("Fast")
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.HorizontalFit
                    font.family: "Times New Roman"
                }

                MouseArea {
                    id: clkFast
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
                    onClicked: { entityManager.createEntityFromEntityTypeAndVariationType( {entityType: "fast"} ) }
                }
            }

            Rectangle {
                id: recIrregular
                x: 218
                y: 417
                width: 94
                height: 55
                color: "#ffffff"
                border.width: 2
                border.color: "#435b12"
                Text {
                    id: txtLabelIrregular
                    x: 0
                    y: 0
                    width: 94
                    height: 55
                    text: qsTr("Irregular")
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.HorizontalFit
                    font.family: "Times New Roman"
                }

                MouseArea {
                    id: clkIrregular
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
                    onClicked: { entityManager.createEntityFromEntityTypeAndVariationType( {entityType: "irregular"} ) }
                }

            }

            Rectangle {
                id: recStart
                x: 8
                y: 8
                width: 94
                height: 55
                color: "#b2fc68"
                border.width: 2
                border.color: "#435b12"
                Text {
                    id: txtLabelStart
                    x: 0
                    y: 0
                    width: 94
                    height: 55
                    text: qsTr("Start")
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.HorizontalFit
                    font.family: "Times New Roman"
                }

                MouseArea {
                    id: clkStart
                    width: parent.width
                    height: parent.height
                    onClicked: { timerSpawn.running = true }
                }
            }

            Rectangle {
                id: recStop
                x: 218
                y: 8
                width: 94
                height: 55
                color: "#f96f6f"
                border.width: 2
                border.color: "#435b12"
                Text {
                    id: txtLabelStop
                    x: 0
                    y: 0
                    width: 94
                    height: 55
                    text: qsTr("Stop")
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.HorizontalFit
                    font.family: "Times New Roman"
                }

                MouseArea {
                    id: clkStop
                    width: parent.width
                    height: parent.height
                    onClicked: { timerSpawn.running = false }
                }
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
                entityManager.createEntityFromEntityTypeAndVariationType({ entityType: arrayChance.aEntityType[Math.round((Math.random() * arrayChance.aEntityType.length))].toString() })
                interval = Math.floor((Math.random() * 1500) + 750)
            }
        }

        Text {
            id: textScore
            text: "0"
            font.pointSize: 16
            x: (parent.width / 2) - (width / 2)
            y: 8
            color: "#ff0000"

        }
    }
}
