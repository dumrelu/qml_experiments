import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Button {
        id: dummyButton
        visible: false
        text: "Button #999"
    }

    GridLayout {
        id: gridLayout
        anchors.fill: parent

        columns: Math.ceil( (gridLayout.width - repeater.model * gridLayout.columnSpacing )/ dummyButton.implicitWidth)

        Repeater {
            id: repeater
            model: 5

            Button {
                Layout.fillWidth: true
                text: "Button #" + index
            }
        }
    }
}
