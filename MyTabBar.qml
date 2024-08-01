import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    id: customTabBar
    width: parent.width
    property int maxTabsPerLine: 4
    property int maxNumberOfTabBars: 3

    property var tabs: []

    function calculateNumberOfTabBars() {
        let totalTabs = tabs.length;
        let tabsPerBar = maxTabsPerLine;
        let maxTabsCapacity = maxTabsPerLine * maxNumberOfTabBars;
        return totalTabs <= maxTabsCapacity ? Math.ceil(totalTabs / tabsPerBar) : maxNumberOfTabBars;
    }

    function getTabsForBar(barIndex) {
        let start = barIndex * maxTabsPerLine;
        let end = start + maxTabsPerLine;
        if (barIndex == customTabBar.calculateNumberOfTabBars() - 1) {
            end = tabs.length;
        }
        return tabs.slice(start, end);
    }

    Column {
        width: parent.width

        Repeater { // Repeat m times the TabBar creation (the model's repeater can be seen as a "forloop"
            model: customTabBar.calculateNumberOfTabBars()

            TabBar {
                width: parent.width
                background: Rectangle {
                    color: "gray"
                }

                property int tabBarIndex: index

                Repeater { // Repeat foreach tabs in the correct slice
                    model: customTabBar.getTabsForBar(tabBarIndex)

                    TabButton {
                        text: modelData
                        onClicked: {
                            let globalIndex = model.index + (customTabBar.maxTabsPerLine * tabBarIndex);
                            console.log("Clicked tabbar index:", tabBarIndex);
                            console.log("Clicked tab index in tabbar:", model.index);
                            customTabBar.onTabClicked(globalIndex);
                        }
                    }
                }
            }
        }
    }

    function onTabClicked(index) {
        customTabBar.tabClicked(index)
    }

    signal tabClicked(int index)
}
