import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: parent.width
    height: parent.height
    color: "white"

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
                    id: identry
                    text: model.ID
                    anchors.left: parent.left
                }
                Text {
                    id: nameentry
                    text: model.NAME
                    anchors.left: identry.right
                }
                Text {
                    id: ageentry
                    text: model.AGE
                    anchors.left: nameentry.right
                }
                Text {
                    id: salaryentry
                    text: model.SALARY
                    anchors.left: ageentry.right
                }
            }
        }
    }
}

