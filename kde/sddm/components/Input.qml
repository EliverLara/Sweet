import QtQuick 2.2
import QtQuick.Controls

TextField {
    placeholderTextColor: config.color
    palette.text: config.color
    font.pointSize: config.fontSize
    font.family: config.font
    width: parent.width
    background: Rectangle {
        color: "#252a3f"
        opacity: 0.7
        radius: parent.width / 2
        width: parent.width
        height: width / 9
        border.width: 1
        border.color: parent.focus ? config.selected_color : "#121517"
        anchors.fill: parent
    }
}
