import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: 200
        height: 100
        color: "orange"
        anchors.centerIn: parent

        Text {
            anchors.centerIn: parent
            text: "Hello, World!"
        }
    }
}
