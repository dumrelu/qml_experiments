import QtQuick
import QtQuick.Controls
import my_module

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Page {
        anchors.fill: parent

        MyTestButton {
            anchors.centerIn: parent
        }
    }
}
