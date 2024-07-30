import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "TabBar Example"

    Column {
        anchors.fill: parent

        TabBar {
            id: tabBar
            width: parent.width
            background: Rectangle {
                color: "gray"
            }

            TabButton {
                text: "Tab 1"
                onClicked: stackView.push(tab1Content)
            }
            TabButton {
                text: "Tab 2"
                onClicked: stackView.push(tab2Content)
            }
            TabButton {
                text: "Tab 3"
                onClicked: stackView.push(tab3Content)
            }
        }

        StackView {
            id: stackView
            anchors.fill: parent
            anchors.topMargin: tabBar.height
            initialItem: tab1Content
        }
    }

    Component {
        id: tab1Content
        Rectangle {
            width: parent.width
            height: parent.height
            color: "lightblue"
            Text {
                anchors.centerIn: parent
                text: "Content for Tab 1"
            }
        }
    }

    Component {
        id: tab2Content
        Rectangle {
            width: parent.width
            height: parent.height
            color: "lightgreen"
            Text {
                anchors.centerIn: parent
                text: "Content for Tab 2"
            }
        }
    }

    Component {
        id: tab3Content
        Rectangle {
            width: parent.width
            height: parent.height
            color: "lightcoral"
            Text {
                anchors.centerIn: parent
                text: "Content for Tab 3"
            }
        }
    }
}
