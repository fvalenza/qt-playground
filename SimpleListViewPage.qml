import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: parent.width
    height: parent.height
    color: "white"

    property var itemList: []

    ListView {
        id: listView
        anchors.fill: parent
        model: itemList

        delegate: Item {
            width: listView.width
            height: 40

            Rectangle {
                width: parent.width
                height: parent.height
                color: index % 2 == 0 ? "lightgray" : "white"
                Text {
                    text: modelData
                    anchors.centerIn: parent
                }
            }
        }
    }
}
