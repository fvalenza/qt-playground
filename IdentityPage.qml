import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: parent.width
    height: parent.height
    color: "white"
    property alias firstName: firstNameField.text
    property alias lastName: lastNameField.text

    Column {
        anchors.centerIn: parent
        spacing: 10

        Row {
            spacing: 10
            Label {
                text: "Firstname:"
            }
            TextField {
                id: firstNameField
                width: 200
            }
        }

        Row {
            spacing: 10
            Label {
                text: "Name:"
            }
            TextField {
                id: lastNameField
                width: 200
            }
        }

        Row {
            spacing: 20
            Button {
                text: "Reset"
                onClicked: {
                    firstNameField.text = ""
                    lastNameField.text = ""
                }
            }
            Button {
                text: "OK"
                onClicked: {
                    resultText.text = "Your name is " + firstNameField.text + " " + lastNameField.text
                }
            }
        }

        TextArea {
            id: resultText
            width: 300
            height: 100
            readOnly: true
        }
    }
}
