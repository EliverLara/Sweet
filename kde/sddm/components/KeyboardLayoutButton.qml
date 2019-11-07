import QtQuick 2.1
import QtQuick.Controls 1.1 as QQC

import org.kde.plasma.components 2.0 as PlasmaComponents

import org.kde.plasma.workspace.keyboardlayout 1.0

PlasmaComponents.ToolButton {
    id: kbLayoutButton

    iconName: "input-keyboard"
    implicitWidth: minimumWidth
    text: layout.currentLayoutDisplayName

    Accessible.name: i18ndc("plasma_lookandfeel_org.kde.lookandfeel", "Button to change keyboard layout", "Switch layout")

    visible: layout.layouts.length > 1

    onClicked: layout.nextLayout()

    KeyboardLayout {
          id: layout
              function nextLayout() {
              var layouts = layout.layouts;
              var index = (layouts.indexOf(layout.currentLayout)+1) % layouts.length;
              layout.currentLayout = layouts[index];
          }
    }
}
