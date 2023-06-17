//@ This file is part of opal-infocombo.
//@ https://github.com/Pretty-SFOS/opal-infocombo
//@ SPDX-FileCopyrightText: 2023 Mirian Margiani
//@ SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.0
import Sailfish.Silica 1.0

/*!
    \qmltype InfoMenuItem
    \inqmlmodule Opal.InfoCombo
    \inherits QtObject
    \brief Provides a menu item with a description.

    Using this component is not necessary. You can simply
    define a standard menu item and add a “info” string property.

    \sa InfoCombo
*/
MenuItem {
    /*!
      This property holds the info that will be shown on the info page.
    */
    property string info

    /*!
      This property defines a function that will be called when a link is activated.

      Links in the form of \c {<a href="example.org">Example</a>} are supported
      in descriptions and will be opened externally by default, using \c {Qt.openUrlExternally}.

      The handler function takes the URL to be opened as its only argument (\a link).
    */
    property var linkHandler: function(link) {
        Qt.openUrlExternally(link)
    }
}
