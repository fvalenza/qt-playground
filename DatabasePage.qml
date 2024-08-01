import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: parent.width
    height: parent.height
    color: "white"

    property var model: null

    TableView {
        anchors.fill: parent
        columnSpacing: 1
        rowSpacing: 1
        clip: true
        id: tableView

        model: root.model

        // Row {
        //     id: columnsHeader
        //     y: tableView.contentY
        //     Repeater {
        //         Text {
        //             text: modelDisplay
        //         }


        //     }
        // }

        delegate: Rectangle {
            implicitWidth: 100
            implicitHeight: 50
            border.width: 1
            border.color: "black"
            color: index % 2 == 0 ? "lightgray" : "white"

            Text {
                text: NAME
                anchors.centerIn: parent
            }
            // Text {
            //     text: model.NAME
            //     anchors.centerIn: parent
            // }
        }
    }

    // ListView {
    //     id: listView
    //     anchors.fill: parent
    //     model: root.model

    //     delegate: Item {
    //         width: listView.width
    //         height: 40

    //         Rectangle {
    //             width: parent.width
    //             height: parent.height
    //             color: index % 2 == 0 ? "lightgray" : "white"
    //             Text {
    //                 id: identry
    //                 text: model.ID
    //                 anchors.left: parent.left
    //             }
    //             Text {
    //                 id: nameentry
    //                 text: model.NAME
    //                 anchors.left: identry.right
    //             }
    //             Text {
    //                 id: ageentry
    //                 text: model.AGE
    //                 anchors.left: nameentry.right
    //             }
    //             Text {
    //                 id: salaryentry
    //                 text: model.SALARY
    //                 anchors.left: ageentry.right
    //             }
    //         }
    //     }
    // }
}

