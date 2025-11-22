import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: loginWindow
    width: 400
    height: 500
    title: "Squirrel - 登录"
    visible: true
    color: "#f5f5f5"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20
        width: 300

        Image {
            source: "qrc:/resources/logo.png"
            width: 100
            height: 100
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: usernameField
            placeholderText: "用户名"
            Layout.fillWidth: true
            padding: 12
            font.pointSize: 14
            background: Rectangle {
                color: "white"
                border.color: usernameField.focused ? "#2196F3" : "#ddd"
                border.width: 1
                radius: 8
            }
        }

        TextField {
            id: passwordField
            placeholderText: "密码"
            echoMode: TextInput.Password
            Layout.fillWidth: true
            padding: 12
            font.pointSize: 14
            background: Rectangle {
                color: "white"
                border.color: passwordField.focused ? "#2196F3" : "#ddd"
                border.width: 1
                radius: 8
            }
        }

        Button {
            text: "登录"
            Layout.fillWidth: true
            padding: 12
            font.pointSize: 14
            background: Rectangle {
                color: "#2196F3"
                radius: 8
            }
            contentItem: Text {
                text: "登录"
                color: "white"
                font.pointSize: 14
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: {
                // 登录逻辑待实现
                if (usernameField.text && passwordField.text) {
                    loginWindow.close();
                    var mainWindow = Qt.createQmlObject('import QtQuick.Controls 2.15; import QtQuick.Layouts 1.15; import QtQuick 2.15; ApplicationWindow { visible: true; width: 800; height: 600; Loader { source: "qrc:/qml/Main.qml" } }', loginWindow, "mainWindow");
                } else {
                    showError("请输入用户名和密码");
                }
            }
        }
    }

    function showError(message) {
        errorDialog.text = message;
        errorDialog.open();
    }

    Dialog {
        id: errorDialog
        title: "错误"
        modal: true
        standardButtons: Dialog.Ok
    }
}
