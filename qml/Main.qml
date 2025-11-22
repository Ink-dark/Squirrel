import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "Squirrel App"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "hello world"
            font.pointSize: 24
            color: "#333333"
        }

        Button {
            text: "Exit"
            onClicked: Qt.quit()
            width: 100
            height: 40
            background: Rectangle {
                color: button.pressed ? "#ff6b6b" : "#4ecdc4"
                radius: 5
            }
        }
    }
}