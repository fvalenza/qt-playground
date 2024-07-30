// DefaultPage.qml
import QtQuick

Rectangle {
    id: root
    property alias defaultPageText: pageText.text

    width: parent.width
    height: parent.height
    color: "yellow"
    Text {
        id: pageText
        anchors.centerIn: parent
        text: "Default page content"
    }
}
