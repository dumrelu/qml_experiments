import QtQuick.Controls

Button {
    width: 150

    text: "Click me!"

    onClicked: {
        width = 300;
    }
}
