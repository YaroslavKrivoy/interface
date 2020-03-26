import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 580
    title: qsTr("Hello World")
    minimumWidth: 516
    minimumHeight: 516

    Rectangle {
        id: rectangle
        width: 258
        height: 258
        color: "#880000"
        clip: false
        visible: true
        transformOrigin: Item.TopLeft
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }

    Rectangle {
        id: rectangle1
        x: 382
        width: 258
        height: 258
        color: "#ff0000"
        transformOrigin: Item.TopRight
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
    }

    Rectangle {
        id: rectangle2
        y: 338
        width: 258
        height: 258
        color: "#00ff00"
        transformOrigin: Item.BottomLeft
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }

    Rectangle {
        id: rectangle3
        x: 382
        y: 338
        width: 258
        height: 258
        color: "#008800"
        transformOrigin: Item.BottomRight
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
    }

    Rectangle {
        id: rectangle4
        x: 186
        y: 181
        width: 258
        height: 258
        color: "#4169e1"
        radius: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        transformOrigin: Item.Center
        rotation: -45
        opacity: 1
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:258;anchors_width:258;anchors_x:0;anchors_y:0}D{i:2;anchors_width:258;anchors_x:382;anchors_y:0}
D{i:3;anchors_width:258;anchors_x:0}D{i:4;anchors_width:258;anchors_x:382}D{i:5;anchors_height:229;anchors_width:258;anchors_x:186;anchors_y:181}
}
##^##*/
