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
            TabButton {
                text: "Input Page"
                onClicked: stackView.push(identityPage)
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
        DefaultPage {
            color: "lightblue"
            defaultPageText: "Content for Tab 1"
        }
    }

    Component {
        id: tab2Content
        DefaultPage {
            color: "lightgreen"
            defaultPageText: "Content for Tab 2"
        }
    }

    Component {
        id: tab3Content
        DefaultPage {
            color: "lightcoral"
            defaultPageText: "Content for Tab 3"
        }
    }

    Component {
        id: tab4Content
        DefaultPage {
            color: "darkred"
            // defaultPageText: "Content for Tab 4"
        }
    }

    Component {
        id: identityPage
        IdentityPage {}
        // Either use the line above or the Loader. TODO : learn the difference
        // Loader {
        //     source: "IdentityPage.qml"
        // }
    }

}

