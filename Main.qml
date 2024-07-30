//import related modules
import QtQuick
import QtQuick.Controls

//window containing the application.
// An Application window is a certain type of Window with already provided zones menuBar, header, footer
ApplicationWindow {
    visible: true
    //title of the application
    title: qsTr("Hello World")
    width: 640
    height: 480


    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
        Menu {
            title: qsTr("menu2")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: console.log("menu2 triggered");
            }
        }
    }

    // header: ToolBar {
    //     ToolButton {
    //         text: qsTr("tools")
    //     }
    // }

    // footer: TabBar {
    //     id: footerTabBar
    //     width: parent.width
    //     TabButton {
    //         text: "Tab 1"
    //         onClicked: stackView.push(tab1Content)
    //     }
    //     TabButton {
    //         text: "Tab 2"
    //         onClicked: stackView.push(tab2Content)
    //     }
    //     TabButton {
    //         text: "Tab 3"
    //         onClicked: stackView.push(tab3Content)
    //     }
    // }

    Column {
        id: centralArea
        anchors.fill: parent

        TabBar {
            id: cenralAreatabBar
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
            TabButton {
                text: "Tab 4"
                onClicked: stackView.push(tab4Content)
            }
        }

        StackView {
            id: stackView
            anchors.fill: parent
            anchors.topMargin: cenralAreatabBar.height
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

    Component {
        id: tab4Content
        Rectangle {
            width: parent.width
            height: parent.height
            color: "darkred"
            Text {
                anchors.centerIn: parent
                text: "Content for Tab 4"
            }
        }
    }
}

