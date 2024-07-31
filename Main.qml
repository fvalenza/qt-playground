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





        StackView {
            id: stackView
            anchors.fill: parent
            anchors.top: customTabBar.bottom
            anchors.topMargin: customTabBar.height
            initialItem: tab1Content
        }
        MyTabBar {
            id: customTabBar
            // maxTabsPerLine: 3
            width: parent.width
            tabs: ["Tab 1", "Tab 2", "Tab 3", "Tab 4", "Input Page", "Database Page", "SimpleListView Page", "C++ provided ListView Page"]

            onTabClicked: {
                switch (index) {
                    case 0: stackView.push(tab1Content); break
                    case 1: stackView.push(tab2Content); break
                    case 2: stackView.push(tab3Content); break
                    case 3: stackView.push(tab4Content); break
                    case 4: stackView.push(identityPage); break
                    case 5: stackView.push(databasePage); break
                    case 6: stackView.push(simplelistviewPage); break
                    case 7: stackView.push(listviewPage); break
                }
            }
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

    Component {
        id: databasePage
        DatabasePage {}
    }

    Component {
        id: simplelistviewPage
        SimpleListViewPage {
            itemList: ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
        }
    }

    ListModel {
        id: listmodelID
    }

    Component {
        id: listviewPage
        ListViewPage {
            model: listModel
            // itemList: listmodelID.items
            // itemList: ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
        }
    }

}

