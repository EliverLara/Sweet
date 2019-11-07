import QtQuick 2.5
import QtQuick.VirtualKeyboard 2.1

InputPanel {
    id: inputPanel
    property bool activated: false
    active: activated && Qt.inputMethod.visible
    visible: active
    width: parent.width
}
