import QtQuick 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4

TextField {
    placeholderTextColor: config.color
    palette.text: config.color
    font.pointSize: config.fontSize
    font.family: config.font
    background: Rectangle {
        color: "#1E2326"
        opacity: 0.7
        radius: parent.width / 2
        width: parent.width
        height: width / 9
        border.width: 1
        border.color: "#121517"
        anchors.centerIn: parent
    }
}
