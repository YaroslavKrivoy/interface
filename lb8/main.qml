import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 680
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

        Text {
            id: element
            x: 112
            y: 115
            color: "#ffffff"
            text: qsTr("Номер группы")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
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

        Text {
            id: element1
            x: 118
            y: 122
            color: "#0000ff"
            text: qsTr("http://www.qml.io/")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.underline: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
        }
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

        Text {
            id: element2
            x: 118
            y: 122
            text: qsTr("#00FF00")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }
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

        Text {
            id: element3
            x: 118
            y: 122
            width: 204
            height: 172
            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
            z: 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: rectangle4
        x: 186
        y: 181
        width: 258
        height: 258
        color: "#4169e1"
        radius: 25
        anchors.verticalCenterOffset: 1
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        transformOrigin: Item.Center
        rotation: -45
        opacity: 1

        Text {
            id: element4
            x: 126
            y: 116
            width: 124
            height: 33
            text: qsTr("Кривой Ярослав Вячеславович")
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            font.pixelSize: 16
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:258;anchors_width:258;anchors_x:0;anchors_y:0}D{i:3;anchors_width:258;anchors_x:382;anchors_y:0}
D{i:5;anchors_width:258;anchors_x:0}D{i:7;anchors_width:258;anchors_x:382}D{i:9;anchors_height:229;anchors_width:258;anchors_x:186;anchors_y:181}
D{i:11;anchors_width:100;anchors_x:270;anchors_y:2}D{i:14;anchors_height:100;anchors_width:100;anchors_x:8;anchors_y:8}
D{i:16;anchors_height:100;anchors_width:100;anchors_x:8;anchors_y:8}D{i:18;anchors_height:100;anchors_width:100;anchors_x:8;anchors_y:8}
D{i:20;anchors_height:100;anchors_width:100;anchors_x:8;anchors_y:8}D{i:22;anchors_height:100;anchors_width:100;anchors_x:8;anchors_y:8}
D{i:24;anchors_height:100;anchors_width:100;anchors_x:8;anchors_y:8}D{i:26;anchors_height:100;anchors_width:100;anchors_x:8;anchors_y:8}
}
##^##*/
