pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Basic
import QmlIntermediate

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("QML Anonymous")

    property int loading: Globals.status //QML property bound to Q_ENUM
    property string statusMessage: Globals.status ? "Loading" : "Ready"
    required property BingoModel bingoModel //QML_UNCREATABLE
    //QML_ANONYMOUS cannot create this item or property
    //Counters {}
    //property Counters counters
    BingoResults { id: bingoResults }

    Connections {
        target: Globals
        function onNumChanged() {
            if (!dialog.visible) { // if dialog is showing results, want to ignore this during reset
                let modelCount = root.bingoModel.rowCount()
                for (let i = 0; i < modelCount ; i++) {
                    let index = root.bingoModel.index(i, 0)
                    if(root.bingoModel.data(index, 1) === Globals.num && root.bingoModel.data(index, 2) === false) {
                        root.bingoModel.setListElem(i, {"number": root.bingoModel.data(index, 1), "found": true})
                        bingoResults.matchCounter++ //anonymous property - class cannot be referred to by name in QML
                    }
                }

                bingoResults.calculate(bingoResults.matchCounter, bingoResults.turnsRemaining, root.bingoModel.rowCount()) //calculate win or lose in child class exposed as QML_ELEMENT

                if (bingoResults.message !== "")
                    dialog.open()

                bingoResults.turnsRemaining-- //anonymous property
            }
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 15

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 14
            text: "Generated number: " + Globals.num
        }

        Button {
            id: btn
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Click to generate a number"
            enabled: !root.loading

            onClicked: {
                Globals.status = Globals.Loading //set QML_ENUM
                timer.restart()
            }
        }

        Timer { //simulate the loading of the app
            id: timer

            running: true
            repeat: true

            onTriggered: {
                if (root.loading === Globals.Loading) {
                    Globals.generateNumber()
                    Globals.status = Globals.Ready //set QML_ENUM
                }
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
            text: "Generator status: " + root.statusMessage
        }

        BusyIndicator {
            width: 50
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            running: root.loading
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 2

            Repeater {
                model: root.bingoModel

                delegate: Rectangle {
                    id: viewDelegate

                    width: 40
                    height: 40

                    required property int index
                    required property int number
                    required property bool found

                    color: viewDelegate.found ? "lightgreen" : "lightcoral"

                    Text {
                        anchors.centerIn: parent

                        font.pointSize: 14
                        text: viewDelegate.number
                    }
                }
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
            text: "Turns remaining : " + bingoResults.turnsRemaining
        }

        Dialog {
            id: dialog

            implicitWidth: 200
            implicitHeight: 200
            anchors.centerIn: parent
            modal: true
            title: "Game over"

            Column {
                anchors.centerIn: parent
                spacing: 15

                Text {
                    id: dialogText

                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 16
                }

                Button {
                    id: resetButton

                    width: 70
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Reset"

                    onClicked: { //reset procedure
                        Globals.num = 0
                        dialog.visible = false
                        bingoResults.turnsRemaining = 10
                        bingoResults.matchCounter = 0
                        root.bingoModel.resetModel()
                    }
                }
            }

            onOpened: dialogText.text = bingoResults.message
        }
    }
}
