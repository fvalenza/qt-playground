//import related modules
import QtQuick
import QtQuick.Controls

//window containing the application
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

    header: ToolBar {
        ToolButton {
            text: qsTr("tools")
        }
    }

    footer: TabBar {
            width: parent.width
            TabButton {
                text: "First"
                width: implicitWidth
            }
            TabButton {
                text: "Second"
                width: implicitWidth
            }
            TabButton {
                text: "Third"
                width: implicitWidth
            }
    }

    StackView {
        anchors.fill: parent
        //a button in the middle of the content area
        Button {
            text: qsTr("Hello World")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            onClicked: console.log("Hello World Button triggered");
        }
    }
}

