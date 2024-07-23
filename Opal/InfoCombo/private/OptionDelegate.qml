//@ This file is part of opal-infocombo.
//@ https://github.com/Pretty-SFOS/opal-infocombo
//@ SPDX-FileCopyrightText: 2024 Mirian Margiani
//@ SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.6
import Sailfish.Silica 1.0

SilicaControl {
    id: root
    height: column.height
    width: parent.width
    highlighted: toggle.highlighted || area.containsPress

    property bool allowChanges
    property ComboBox comboBox
    property int modelIndex

    signal linkActivated(var link)

    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: toggle.clicked(mouse)
    }

    Column {
        id: column
        width: parent.width

        TextSwitch {
            id: toggle

            height: implicitHeight
            checked: !!comboBox && comboBox.currentIndex == modelIndex
            automaticCheck: false
            leftMargin: Theme.horizontalPageMargin + Theme.paddingMedium

            Binding on highlighted {
                when: !allowChanges || area.containsMouse
                value: true
            }

            text: modelData.title

            onClicked: {
                if (!allowChanges || !comboBox || comboBox.currentIndex == modelIndex) {
                    return
                }

                comboBox.currentIndex = modelIndex
            }
        }

        Label {
            id: desc
            x: toggle._label.x
            width: toggle._label.width
            height: text.length > 0 ? (implicitHeight + Theme.paddingMedium) : 0
            opacity: root.enabled ? 1.0 : Theme.opacityLow
            wrapMode: Text.Wrap
            font.pixelSize: Theme.fontSizeSmall

            // Colors with proper Silica styling:
            // color: highlighted ? root.palette.secondaryHighlightColor : root.palette.secondaryColor
            // linkColor: highlighted ? root.palette.highlightColor : root.palette.primaryColor

            // Colors in use because of Silica limitations:
            // Interactive items should use primary/secondary colors, and
            // this is an interactive item. Still, it is annoying if large
            // items flicker when scrolling, and it is not possible to
            // use Silica's workaround because that relies on private components
            // which are not allowed in Harbour. So the least bad solution
            // to avoid flickering is to make this item appear non-interactive.
            color: root.palette.secondaryHighlightColor
            linkColor: highlighted ? root.palette.highlightColor : root.palette.secondaryColor

            onLinkActivated: root.linkActivated(link)

            text: modelData.text
        }
    }
}
