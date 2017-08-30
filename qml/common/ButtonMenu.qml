import QtQuick 2.0

Rectangle {
    id: button

    width: buttonText.width+ paddingHorizontal*2
    height: buttonText.height+ paddingVertical*2

    color: "#060942" //Dark Blue
    radius: 8
    z: 6 //UI

    property int paddingHorizontal: 10
    property int paddingVertical: 5

    property alias bgColor: button.color
    property alias text: buttonText.text
    property alias fgColor: buttonText.color
    property alias font: buttonText.font

    signal clicked

    Text {
        id: buttonText
        anchors.centerIn: parent
        font.pixelSize: 20

        color: "#FFFFFF"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: button.clicked()
        onPressed: button.opacity = 0.6
        onReleased: button.opacity = 1
    }
}
