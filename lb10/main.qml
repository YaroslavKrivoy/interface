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

    MouseArea {
        id: mouseArea
        height: 23
        hoverEnabled: true
        anchors.right: rectangle1.left
        anchors.rightMargin: 12
        anchors.left: rectangle.right
        anchors.leftMargin: 12
        anchors.top: parent.top
        anchors.topMargin: 2
        onClicked: Qt.quit()

        Text {
            id: element5
            x: 39
            y: 25
            text: qsTr("Закрыть")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }
    }

    Rectangle {
        id: rectangle5
        x: 8
        y: 333
        width: 15
        height: 15
        color: "#ff0000"

        MouseArea {
            id: mouseArea1
            hoverEnabled: true
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onPressed:
                if(mouse.button & Qt.LeftButton){
                    rectangle4.color = "#ff0000"
                }
                else if(mouse.button & Qt.RightButton){
                    rectangle4.color = "#f08080";
                }
        }
    }

    Rectangle {
        id: rectangle6
        x: 29
        y: 333
        width: 15
        height: 15
        color: "#ffa500"

        MouseArea {
            id: mouseArea2
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked:
                if(mouse.button & Qt.LeftButton){
                    rectangle4.color = "#ffa500";
                }
                else if(mouse.button & Qt.RightButton){
                    rectangle4.color = "#ff9933";
                }
        }
    }

    Rectangle {
        id: rectangle7
        x: 50
        y: 333
        width: 15
        height: 15
        color: "#ffff00"

        MouseArea {
            id: mouseArea3
            hoverEnabled: true
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked:
                if(mouse.button & Qt.LeftButton){
                    rectangle4.color = "#ffff00";
                }
                else if(mouse.button & Qt.RightButton){
                    rectangle4.color = "#ffffe0";
                }
        }
    }

    Rectangle {
        id: rectangle8
        x: 71
        y: 333
        width: 15
        height: 15
        color: "#008000"

        MouseArea {
            id: mouseArea4
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked:
                if(mouse.button & Qt.LeftButton){
                    rectangle4.color = "#008000";
                }
                else if(mouse.button & Qt.RightButton){
                    rectangle4.color = "#228b22";
                }
        }
    }

    Rectangle {
        id: rectangle9
        x: 8
        y: 361
        width: 15
        height: 15
        color: "#00ffff"

        MouseArea {
            id: mouseArea5
            hoverEnabled: true
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked:
                if(mouse.button & Qt.LeftButton){
                    rectangle4.color = "#00ffff";
                }
                else if(mouse.button & Qt.RightButton){
                    rectangle4.color = "#7fffd4";
                }
        }
    }

    Rectangle {
        id: rectangle10
        x: 29
        y: 361
        width: 15
        height: 15
        color: "#0000ff"

        MouseArea {
            id: mouseArea6
            hoverEnabled: true
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked:
                if(mouse.button & Qt.LeftButton){
                    rectangle4.color = "#0000ff";
                }
                else if(mouse.button & Qt.RightButton){
                    rectangle4.color = "#4169e1";
                }
        }
    }

    Rectangle {
        id: rectangle11
        x: 50
        y: 361
        width: 15
        height: 15
        color: "#ee82ee"

        MouseArea {
            id: mouseArea7
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked:
                if(mouse.button & Qt.LeftButton){
                    rectangle4.color = "#ee82ee";
                }
                else if(mouse.button & Qt.RightButton){
                    rectangle4.color = "#dda0dd";
                }

        }
    }

    Rectangle {
        id: rectangle12
        x: 507
        y: 305
        width: 113
        height: 85
        color: "#256584"

        MouseArea {
            id: mouseArea8
            hoverEnabled: true
            anchors.fill: parent
            cursorShape: Qt.CrossCursor
            drag {
                  target: parent
                  minimumY: 0
                  minimumX: 0
                  maximumX: parent.parent.width - parent.width
                  maximumY: parent.parent.height - parent.height
            }
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
D{i:28;anchors_height:100;anchors_width:100;anchors_x:25;anchors_y:32}
}
##^##*/
