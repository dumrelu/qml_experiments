import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// Mimic functionality from Qt 6.7 https://doc.qt.io/qt-6/qml-qtquick-layouts-layoutitemproxy.html

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property bool isPortrait: root.height > root.width

    Rectangle {
        id: background
        anchors.fill: parent
        color: "gray"
    }


    Rectangle {
        id: someContentItem

        anchors.fill: parent

        implicitHeight: 250
        implicitWidth: 250
        color: "red"

        Text {
            anchors.centerIn: parent
            text: "Random number " + Math.floor(Math.random() * 100)
        }
    }

    RowLayout {
        id: rowLayout

        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        visible: false

        Label {
            text: "Row layout"
        }

        Item {
            id: rowProxy

            Layout.fillWidth: true
            Layout.preferredHeight: someContentItem.implicitHeight
        }
    }

    RowLayout {
        id: columnLayout

        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height
        visible: false

        Label {
            text: "Row layout"
        }

        Item {
            id: columnProxy

            Layout.fillHeight: true
            Layout.preferredWidth: someContentItem.implicitWidth
        }
    }

    Item {
        states: [
            State {
                name: "landscape"
                when: !root.isPortrait

                PropertyChanges {
                    target: someContentItem
                    parent: rowProxy
                }

                PropertyChanges {
                    target: rowLayout
                    visible: true
                }
            },

            State {
                name: "portrait"
                when: root.isPortrait

                PropertyChanges {
                    target: someContentItem
                    parent: columnProxy
                }

                PropertyChanges {
                    target: columnLayout
                    visible: true
                }
            }
        ]
    }

}
