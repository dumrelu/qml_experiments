import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import my.backend 1.0

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    MockInfiniteModel {
        id: mockModel
    }

    ListView {
        id: listView

        anchors.fill: parent

        model: mockModel
        spacing: 5

        onAtYEndChanged: {
            if(atYEnd)
            {
                console.log("View at end. Fetching more items");
                mockModel.fetchMoreItems();
            }
        }

        delegate: Rectangle {
            color: "red"
            width: 200
            height: 200

            Text {
                anchors.centerIn: parent

                text: "Index: " + model.indexRole
            }
        }
    }

    Loader {
        id: popupLoader

        active: mockModel.fetchInProgress

        sourceComponent:  Popup {
            id: dialog

            x: root.width / 2 + dialog.width / 2
            y: root.height / 2 - dialog.height / 2
            visible: true

            modal: true
            closePolicy: Popup.NoAutoClose

            BusyIndicator {
                id: busyIndicator
            }
        }
    }
}
