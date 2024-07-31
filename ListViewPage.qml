import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: parent.width
    height: parent.height
    color: "white"

    property var itemList: []
    property var model: null

    ListView {
        id: listView
        anchors.fill: parent
        model: root.model

        delegate: Item {
            width: listView.width
            height: 40

            Rectangle {
                width: parent.width
                height: parent.height
                color: index % 2 == 0 ? "lightgray" : "white"
                Text {
                    text: model.display
                    anchors.centerIn: parent
                }
            }
        }
    }
}
