import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    id: centralArea
    anchors.fill: parent
    spacing: 1

    Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: parent.height * 0.10

        MyTabBar {
            id: customTabBar
            width: parent.width
            height: implicitHeight
            Layout.fillWidth: true
            tabs: ["Tab 1", "Tab 2", "Tab 3", "Tab 4", "Input Page", "Database Page", "SimpleListView Page", "C++ provided ListView Page"]

            onTabClicked: {
                stackLayout.currentIndex = index
            }
        }
    }


    StackLayout {
        id: stackLayout
        Layout.fillWidth: true
        Layout.fillHeight: true

        DefaultPage {
            id: tab1Content
            color: "lightblue"
            defaultPageText: "Content for Tab 1"
        }

        DefaultPage {
            id: tab2Content
            color: "lightgreen"
            defaultPageText: "Content for Tab 2"
        }

        DefaultPage {
            id: tab3Content
            color: "lightcoral"
            defaultPageText: "Content for Tab 3"
        }

        DefaultPage {
            id: tab4Content
            color: "darkred"
            defaultPageText: "Content for Tab 4"
        }

        IdentityPage {
            id: identityPage
        }

        DatabasePage {
            id: databasePage
            model: companyModel
        }

        SimpleListViewPage {
            id: simplelistviewPage
            itemList: ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
        }

        ListViewPage {
            id: listviewPage
            model: listModel //  comes from C++ in main.cpp
        }
    }
    ListModel {
        id: listmodelID // This ont can't be currently used in ListViewPage as model. Not working.
    }
}
