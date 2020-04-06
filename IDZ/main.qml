import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4 as QC1
import QtQuick.Dialogs 1.1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property var locale: Qt.locale()
    property string timeString
    property string dateString
    property string name


    Grid {
        id: grid
        anchors.fill: parent
    }

    Timer {
            id: timer
        }

    function notification(){
        for (var i = 0; i < eventModel.count; i++){
            if(eventModel.get(i).prompt === true){
                timeString = new Date().toLocaleTimeString(locale);
                dateString = new Date().toLocaleDateString(locale, Locale.ShortFormat);
                if(eventModel.get(i).date === dateString && eventModel.get(i).time === timeString){
                    name = eventModel.get(i).name
                    showMessageBox(name);
                    if(eventModel.get(i).promptTime){
                        delay(eventModel.get(i).promptTime, function() {
                            messageBox.text = "Repead notification for event: " + name
                            messageBox.open()
                        });
                    }
                }
            }
        }
    }

    function delay(delayTime, cb) {
            timer.interval = delayTime;
            timer.repeat = false;
            timer.triggered.connect(cb);
            timer.start();
     }



    Rectangle {
        id: rectangle
        x: 39
        y: 41
        width: 200
        height: 70
        color: "#ffffff"
        z: 0
        clip: true
        border.width: 1
        border.color: "#000000"

        TextInput {
            id: textInput
            text: qsTr("")
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            anchors.bottomMargin: 2
            anchors.topMargin: 2
            anchors.fill: parent
            z: 1
            wrapMode: Text.WordWrap
            font.pixelSize: 12
        }
    }

    Text {
        id: element
        x: 39
        y: 21
        text: qsTr("Event")
        font.pixelSize: 12
    }

    Rectangle {
        id: rectangle1
        x: 259
        y: 41
        width: 200
        height: 24
        clip: true
        color: "#ffffff"
        border.width: 1
        border.color: "#000000"
        TextInput {
            id: textInput1
            validator : RegExpValidator { regExp : /(((0[1-9]|[12]\d|3[01])\.(0[13578]|1[02])\.((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\.(0[13456789]|1[012])\.((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\.02\.((19|[2-9]\d)\d{2}))|(29\.02\.((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))/ }
            text: qsTr("")
            cursorVisible: true
            rightPadding: 1
            bottomPadding: 1
            leftPadding: 1
            topPadding: 1
            wrapMode: Text.WordWrap
            clip: false
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            anchors.bottomMargin: 2
            anchors.topMargin: 2
            z: 1
            anchors.fill: parent
            font.pixelSize: 12
        }
    }

    Text {
        id: element1
        x: 259
        y: 21
        text: qsTr("Date")
        font.pixelSize: 12
    }

    Rectangle {
        id: rectangle2
        x: 259
        y: 88
        width: 200
        height: 23
        color: "#ffffff"
        clip: true
        border.width: 1
        border.color: "#000000"
        TextInput {
            id: textInput2
            validator : RegExpValidator { regExp : /(([0,1][0-9])|(2[0-3])):[0-5][0-9]:[0-5][0-9]/ }
            text: qsTr("")
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            anchors.bottomMargin: 2
            anchors.topMargin: 2
            z: 1
            anchors.fill: parent
            font.pixelSize: 12
        }
    }

    Text {
        id: element2
        x: 260
        y: 71
        text: qsTr("Time")
        font.pixelSize: 12
    }

    Rectangle {
        id: rectangle3
        x: 476
        y: 88
        width: 135
        height: 24
        color: "#34e034"
        MouseArea {
            id: mouseArea
            hoverEnabled: true
            anchors.fill: parent

            onClicked:
                eventModel.append({"name":textInput.text, "date":textInput1.text, "time": textInput2.text, "promptTime": textInput3.text, "prompt": checkBox.checked})

            Text {
                id: element3
                x: 41
                y: 5
                text: qsTr("Добавить")
                font.pixelSize: 12
            }
        }
    }


    ListModel {
        id: eventModel

        ListElement {
            name: "Test event";
            date: "06.04.2020";
            time: "18:14:30";
            promptTime: "10000";
            prompt : true
        }
    }

    QC1.TableView {
        id: tableView
        anchors.rightMargin: 9
        anchors.bottomMargin: 25
        anchors.leftMargin: 13
        anchors.topMargin: 140
        anchors.fill: parent
        width: parent.width
        clip: true

        model: eventModel

        QC1.TableViewColumn {
            id: nameColumn
            role: "name"
            title: "name"
            width: 300
        }
        QC1.TableViewColumn {
            id: dateColumn
            role: "date"
            title: "date"
            width: 100
        }
        QC1.TableViewColumn {
            id: timeColumn
            role: "time"
            title: "time"
            width: 100
        }
        QC1.TableViewColumn {
            id: promptTimeColumn
            role: "promptTime"
            title: "promptTime"
            width: 80
        }
        QC1.TableViewColumn {
            id: promptColumn
            role: "prompt"
            title: "prompt"
            width: 40
        }
    }

    Rectangle {
        id: rectangle4
        x: 476
        y: 41
        width: 73
        height: 24
        color: "#ffffff"
        clip: true
        border.width: 1
        border.color: "#000000"
        TextInput {
            id: textInput3
            validator : RegExpValidator { regExp : /[0-9]+/ }
            text: qsTr("")
            z: 1
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            anchors.bottomMargin: 2
            anchors.topMargin: 2
            anchors.fill: parent
            font.pixelSize: 12
        }
    }

    Text {
        id: element4
        x: 476
        y: 21
        text: qsTr("Prompt time(ms)")
        font.pixelSize: 12
    }

    Timer {
            interval: 1000; running: true; repeat: true
            onTriggered:
                notification()
    }



        QC1.CheckBox {
            id: checkBox
            x: 564
            y: 45
            text: qsTr("Prompt")
        }


        MessageDialog {
            id: messageBox
            title: "Notification"
            text: "Welcome"
            icon: StandardIcon.Information
            standardButtons: StandardButton.Ok
            Component.onCompleted: visible = true
        }

        function showMessageBox(message) {
            messageBox.text = "Notification for event: " + message
            messageBox.open()
        }



}

/*##^##
Designer {
    D{i:1;anchors_height:400;anchors_width:400;anchors_x:120;anchors_y:40}D{i:3;anchors_height:80;anchors_width:184;anchors_x:55;anchors_y:47}
D{i:6;anchors_height:20;anchors_width:80;anchors_x:0;anchors_y:4}D{i:9;anchors_height:20;anchors_width:80;anchors_x:0;anchors_y:3}
D{i:10;anchors_height:20;anchors_width:80;anchors_x:0;anchors_y:3}D{i:13;anchors_x:49;anchors_y:5}
D{i:15;anchors_x:49;anchors_y:5}D{i:22;anchors_height:20;anchors_width:80;anchors_x:0;anchors_y:4}
D{i:24;anchors_height:20;anchors_width:80;anchors_x:0;anchors_y:4}
}
##^##*/
