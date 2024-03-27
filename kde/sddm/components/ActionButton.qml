/*
    SPDX-FileCopyrightText: 2016 David Edmundson <davidedmundson@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.15

import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.kirigami 2.20 as Kirigami

Item {
    id: root
    property alias text: label.text
    property alias iconSource: icon.source
    property alias containsMouse: mouseArea.containsMouse
    property alias font: label.font
    property alias labelRendering: label.renderType
    property alias circleOpacity: iconCircle.opacity
    property alias circleVisiblity: iconCircle.visible
    property int fontSize: Kirigami.Theme.defaultFont.pointSize + 1
    readonly property bool softwareRendering: GraphicsInfo.api === GraphicsInfo.Software
    signal clicked

    activeFocusOnTab: true

    property int iconSize: Kirigami.Units.gridUnit * 3

    implicitWidth: Math.max(iconSize + Kirigami.Units.gridUnit * 2, label.contentWidth)
    implicitHeight: iconSize + Kirigami.Units.smallSpacing + label.implicitHeight

    opacity: activeFocus || containsMouse ? 1 : 0.85
    Behavior on opacity {
        PropertyAnimation { // OpacityAnimator makes it turn black at random intervals
            duration: Kirigami.Units.longDuration
            easing.type: Easing.InOutQuad
        }
    }

    Rectangle {
        id: iconCircle
        anchors.centerIn: icon
        width: iconSize + Kirigami.Units.smallSpacing
        height: width
        radius: width / 2
        color: softwareRendering ?  Kirigami.Theme.backgroundColor : Kirigami.Theme.textColor
        opacity: root.activeFocus || containsMouse ? (softwareRendering ? 0.8 : 0.15) : (softwareRendering ? 0.6 : 0)
        Behavior on opacity {
            PropertyAnimation { // OpacityAnimator makes it turn black at random intervals
                duration: Kirigami.Units.longDuration
                easing.type: Easing.InOutQuad
            }
        }
    }

    Rectangle {
        anchors.centerIn: iconCircle
        width: iconCircle.width
        height: width
        radius: width / 2
        scale: mouseArea.containsPress ? 1 : 0
        color: Kirigami.Theme.textColor
        opacity: 0.15
        Behavior on scale {
            PropertyAnimation {
                duration: Kirigami.Units.shortDuration
                easing.type: Easing.InOutQuart
            }
        }
    }

    Kirigami.Icon {
        id: icon
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        width: iconSize
        height: iconSize
        opacity: enabled ? root.opacity : 0.3
        active: mouseArea.containsMouse || root.activeFocus
    }

    PlasmaComponents3.Label {
        id: label
        anchors {
            top: icon.bottom
            topMargin: softwareRendering ? Kirigami.Units.mediumSpacing : Kirigami.Units.smallSpacing
            left: parent.left
            right: parent.right
        }
        style: softwareRendering ? Text.Outline : Text.Normal
        styleColor: softwareRendering ? Kirigami.Theme.backgroundColor : "transparent" //no outline, doesn't matter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.WordWrap
        font.underline: root.activeFocus
        font.pointSize: config.fontSize
        font.family: config.font
        color:activeFocus || containsMouse ? config.highlight_color : config.color
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        onClicked: root.clicked()
        anchors.fill: parent
    }

    Keys.onEnterPressed: clicked()
    Keys.onReturnPressed: clicked()
    Keys.onSpacePressed: clicked()

    Accessible.onPressAction: clicked()
    Accessible.role: Accessible.Button
    Accessible.name: label.text
}
