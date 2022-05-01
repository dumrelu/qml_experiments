import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // Propagates to controls
    font.pointSize: 12

    header: ToolBar {
                RowLayout {
                    anchors.fill: parent
                    ToolButton {
                        text: qsTr("‹")
                        onClicked: stack.pop()
                    }
                    Label {
                        text: "Title"
                        font.bold: true
                        font.pixelSize: root.font.pixelSize * 2
                        elide: Label.ElideRight
                        horizontalAlignment: Qt.AlignHCenter
                        verticalAlignment: Qt.AlignVCenter
                        Layout.fillWidth: true
                    }
                    ToolButton {
                        text: qsTr("⋮")
                        onClicked: menu.open()
                    }
                }
        }

    ColumnLayout {
        RadioButton {
            checked: true
            text: qsTr("First")
        }
        RadioButton {
            text: qsTr("Second")
        }
        RadioButton {
            text: qsTr("Third")
        }

        RowLayout {
            Button {
                text: qsTr("Normal Button")
            }

            Button {
                text: qsTr("Highlighted button")
                highlighted: true
            }
        }

        RoundButton {
            text: "\u2713"
            highlighted: true
        }

        Component.onCompleted: {
            console.log("AAAAAAAAAA");
            console.warn("Application font: " + root.font);
            console.log("application.font = " + Qt.application.font);
        }
    }


}
