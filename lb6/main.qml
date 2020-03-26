import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        id: element
        x: 187
        y: 99
        width: 287
        height: 60
        color: "#008000"
        text: qsTr("Кривой Ярослав")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }

    Text {
        id: element1
        x: 187
        y: 192
        width: 287
        height: 49
        color: "#ee82ee"
        text: qsTr("Группа: 6.1216-1")
        font.italic: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }
}
