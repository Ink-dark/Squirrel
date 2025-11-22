import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

ApplicationWindow {
    id: mainWindow
    width: 800
    height: 600
    title: "HalloChat"
    visible: true

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // 顶部导航栏
        Rectangle {
            color: "#2196F3"
            Layout.fillWidth: true
            height: 56

            RowLayout {
                anchors.centerIn: parent
                spacing: 16

                Image {
                    source: "qrc:/resources/logo.png"
                    onStatusChanged: if (status === Image.Error) console.log("Logo image load error:", errorString)
                    width: 32
                    height: 32
                }

                Label {
                    text: "HalloChat"
                    font.pointSize: 18
                    font.bold: true
                    color: "white"
                }
            }
        }

        // 聊天消息区域
        ScrollView {
            id: chatArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            background: Rectangle { color: "#f9f9f9" }

            ColumnLayout {
                id: chatLayout
                anchors.fill: parent
                spacing: 10
                padding: 16

                // 消息气泡示例 - 使用基础控件实现
                Rectangle {
                    width: parent.width * 0.7
                    height: implicitHeight
                    color: "#e0e0e0"
                    radius: 12
                    padding: 10

                    ColumnLayout {
                        Label {
                            text: "系统"
                            font.bold: true
                            color: "#666"
                        }
                        Label {
                            text: "欢迎使用HalloChat！"
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                        }
                    }
                }

                Rectangle {
                    width: parent.width * 0.7
                    height: implicitHeight
                    color: "#e0e0e0"
                    radius: 12
                    padding: 10
                    Layout.alignment: Qt.AlignLeft

                    ColumnLayout {
                        Label {
                            text: "好友"
                            font.bold: true
                            color: "#666"
                        }
                        Label {
                            text: "你好！这是一条测试消息。"
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                        }
                    }
                }

                Rectangle {
                    width: parent.width * 0.7
                    height: implicitHeight
                    color: "#2196F3"
                    radius: 12
                    padding: 10
                    Layout.alignment: Qt.AlignRight

                    ColumnLayout {
                        Label {
                            text: "我"
                            font.bold: true
                            color: "white"
                            Layout.alignment: Qt.AlignRight
                        }
                        Label {
                            text: "你好！Qt版本的HalloChat看起来不错！"
                            wrapMode: Text.WordWrap
                            color: "white"
                            Layout.fillWidth: true
                        }
                    }
                }
            }
        }

        // 输入区域
        Rectangle {
            color: "white"
            Layout.fillWidth: true
            height: 60
            border.top: 1
            border.color: "#eee"

            RowLayout {
                anchors.fill: parent
                spacing: 8
                padding: 8

                TextField {
                    id: messageInput
                    placeholderText: "输入消息..."
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pointSize: 14
                    background: Rectangle {
                        color: "#f5f5f5"
                        radius: 24
                        padding: 12
                    }
                    onAccepted: sendMessage()
                }

                Button {
                    text: "发送"
                    width: 80
                    backgroundColor: "#2196F3"
                    textColor: "white"
                    radius: 24
                    onClicked: sendMessage()
                }
            }
        }
    }

    function sendMessage() {
        if (messageInput.text.trim()) {
            // 添加新消息到聊天区域
            var bubble = Qt.createComponent("MessageBubble.qml");
            if (bubble.status === Component.Ready) {
                var instance = bubble.createObject(chatLayout, {
                    sender: "我",
                    text: messageInput.text,
                    isOwnMessage: true
                });
            }
            messageInput.text = "";
        }
    }
}

// 消息气泡组件
Component {    id: MessageBubble

    ColumnLayout {
        id: bubbleLayout
        width: parent.width * 0.7
        Layout.alignment: isOwnMessage ? Qt.AlignRight : Qt.AlignLeft

        Label {
            text: sender
            font.pointSize: 12
            color: "#888"
            Layout.alignment: isOwnMessage ? Qt.AlignRight : Qt.AlignLeft
        }

        Rectangle {
            color: isOwnMessage ? "#2196F3" : "white"
            radius: 18
            padding: 12
            Layout.fillWidth: true

            Label {
                text: text
                color: isOwnMessage ? "white" : "black"
                font.pointSize: 14
                wrapMode: Text.WordWrap
            }
        }
    }

    property string sender
    property string text
    property bool isOwnMessage
}