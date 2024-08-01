import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: 800
    height: 600
    color: "white"

    property var model: companyModel  // Ensure this is correctly set in C++ side

    // Header row
    Row {
        id: columnsHeader
        width: root.width  // Ensure the header row spans the entire width
        height: 50
        spacing: 1

        Repeater {
            model: root.model ? root.model.columnCount() : 0

            Rectangle {
                width: 100  // Set appropriate width for each column
                height: 50
                border.width: 1
                border.color: "black"
                color: "lightblue"

                Text {
                    text: root.model ? root.model.headerData(index, Qt.Horizontal) : ""
                    anchors.centerIn: parent
                }
            }
        }
    }

    // TableView positioned below the header
    TableView {
        id: tableview
        width: root.width
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: columnsHeader.bottom
        anchors.bottom: parent.bottom
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        model: root.model

        delegate: Rectangle {
            // width: 100  // Ensure this width matches the column width in the header
            height: 50
            border.width: 1
            border.color: "black"
            color: (index % 2 === 0) ? "lightgray" : "white"

            Text {
                text: {
                    if (!root.model) return "";  // Check if the model is null
                    // Access model data using roles
                    switch (column) {
                        case 0: return model.ID;      // Adjust role names according to your model
                        case 1: return model.NAME;
                        case 2: return model.AGE;
                        case 3: return model.SALARY;
                        default: return "";
                    }
                }
                anchors.centerIn: parent
            }
        }
    }
}
