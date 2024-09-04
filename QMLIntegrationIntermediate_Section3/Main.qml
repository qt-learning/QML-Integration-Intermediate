import QtQuick
import QtQuick.Controls.Basic
import QmlIntermediate

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("QML Enum")

    property int loading: Globals.status //QML property bound to Q_ENUM
    property string statusMessage: Globals.status ? "Loading" : "Ready"

    Column {
        anchors.centerIn: parent
        spacing: 10

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
    }
}
