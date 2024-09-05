import QtQuick
import QtQuick.Controls.Basic
import QmlIntermediate

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("QML Uncreatable")

    property int loading: Globals.status //QML property bound to Q_ENUM
    property string statusMessage: Globals.status ? "Loading" : "Ready"
    required property BingoModel bingoModel //QML_UNCREATABLE

    Connections {
        target: Globals
        function onNumChanged() {
            let modelCount = root.bingoModel.rowCount()
            for (let i = 0; i < modelCount ; i++) {
                let index = root.bingoModel.index(i, 0)
                if(root.bingoModel.data(index, 1) === Globals.num && root.bingoModel.data(index, 2) === false) {
                    root.bingoModel.setListElem(i, {"number": root.bingoModel.data(index, 1), "found": true})
                    console.log("match!: " + Globals.num)
                }
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
    }
}
