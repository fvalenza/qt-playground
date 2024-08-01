//import related modules
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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


    MyTabbedPages {
            id: centralArea
            anchors.fill: parent
        }
}

