import VPlay 2.0
import QtQuick 2.0

GameWindow {
    id: gameWindow

    // You get free licenseKeys from https://v-play.net/licenseKey
    //licenseKey: "<generate one from https://v-play.net/licenseKey>"

    activeScene: scene

    // this resolution is for iPhone 4 & iPhone 4S
    screenWidth: 640
    screenHeight: 960

    Scene {
        id: scene

        // the "logical size" - the scene content is auto-scaled to match the GameWindow size
        width: 320
        height: 480

        // background rectangle matching the logical scene size (= safe zone available on all devices)
        Rectangle {
            id: rectangle
            anchors.fill: parent
            color: "grey"
        }// Rectangle with size of logical scene


    }
}
