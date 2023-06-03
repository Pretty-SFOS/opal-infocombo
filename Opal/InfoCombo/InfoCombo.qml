//@ This file is part of opal-infocombo.
//@ https://github.com/Pretty-SFOS/opal-infocombo
//@ SPDX-FileCopyrightText: 2023 Mirian Margiani
//@ SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.2
import Sailfish.Silica 1.0

/*!
    \qmltype InfoCombo
    \inqmlmodule Opal.InfoCombo
    \inherits ComboBox
    \brief Provides a combo box that can show detailed descriptions of all menu items.

    Use this component when you have to give users extensive
    descriptions of the choices in a combo box or if you need more
    space for the description of a combo box's function.

    \section2 Usage

    Define the combo box like any other \l ComboBox, then add a “info”
    string property on the menu items that should have descriptions.

    Use \l InfoComboSection items to add further sections that do not
    belong to a specific menu item.

    You can use the \l InfoMenuItem shorthand if you do not want to
    add the “info” property manually.

    \section2 Example

    \qml
    InfoCombo {
        width: parent.width
        label: "Food preference"

        InfoComboSection {
            placeAtTop: true
            title: "Food types"
            text: "We provide different kinds of food."
        }

        menu: ContextMenu {
            MenuItem {
                text: "Vegetarian"
                property string info: "Vegetarian food does not have any meat."
            }
            MenuItem {
                text: "Vegan"
                property string info: "Vegan food is completely plant-based."
            }
        }

        InfoComboSection {
            placeAtTop: false
            title: "What about meat?"
            text: "We don't provide any meat."
        }
    }
    \endqml
*/
ComboBox {
    id: root

    readonly property IconButton infoButton: button

    rightMargin: Theme.horizontalPageMargin + Theme.iconSizeMedium

    IconButton {
        id: button
        enabled: root.enabled
        anchors.right: parent.right
        icon.source: "image://theme/icon-m-about"

        Binding on highlighted {
            when: root.highlighted
            value: true
        }

        onClicked: {
            var top = []
            var bottom = []
            var items = []

            for (var i in root.children) {
                var sec = root.children[i]

                if (sec.hasOwnProperty('__is_info_combo_section')) {
                    if (sec.placeAtTop) {
                        top.push(sec)
                    } else {
                        bottom.push(sec)
                    }
                }
            }

            if (root.menu) {
                for (var j in menu._contentColumn.children) {
                    var item = menu._contentColumn.children[j]

                    if (item && item.visible &&
                            item.hasOwnProperty("__silica_menuitem") &&
                            item.hasOwnProperty("info")) {
                        items.push({title: item.text, text: item.info,
                                    isOption: true})
                    }
                }
            }

            var sections = top.concat(items, bottom)

            pageStack.push(Qt.resolvedUrl("private/InfoComboPage.qml"), {
                title: root.label, sections: sections,
                hasExtraSections: top.length > 0 || bottom.length > 0
            })
        }
    }
}
