import QtQuick
import QtQuick.Controls.Basic
import QmlIntermediate

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML Singleton")

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

            onClicked: Globals.generateNumber()
        }
    }
}
