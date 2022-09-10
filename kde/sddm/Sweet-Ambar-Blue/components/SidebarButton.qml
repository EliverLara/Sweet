import QtQuick 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4

Item {
    width: 250
    height: 40
    Rectangle {
        id: rounded
        anchors.fill: parent
        color: "#1e282c"
        radius: 7
    }

    Rectangle {
        id: squareRect

        color: rounded.color
        width: rounded.radius

        anchors.bottom: rounded.bottom
        anchors.top: rounded.top
        anchors.right: rounded.right

    }
}