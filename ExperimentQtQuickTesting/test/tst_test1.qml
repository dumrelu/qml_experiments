import QtQuick
import QtQuick.Controls

import QtTest
import my_module

Item {
    width: 800
    height: 600

    MyTestButton {
        id: myButton
        anchors.centerIn: parent
    }

    TestCase {
        name: "MyButton"
        when: windowShown

        function test_clickToExpand() {
            const widthBeforeClick = myButton.width;
            mouseClick(myButton);
            const widthAfterClick = myButton.width;
            verify(widthBeforeClick < widthAfterClick);
        }
    }
}
