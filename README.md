<!--
SPDX-FileCopyrightText: 2023 Mirian Margiani
SPDX-License-Identifier: GFDL-1.3-or-later
-->

# Info combo box for Sailfish apps

A combo box that can show detailed descriptions of all menu items.

You can use this component when you have to give users extensive descriptions of
the choices in a combo box or if you need more space for the description of a
combo box's function.

## Usage

Define the combo box like any other `ComboBox`, then add a “info” string
property on the menu items that should have descriptions.

Use `InfoComboSection` items to add further sections that do not belong to a
specific menu item.

You can use the `InfoMenuItem` shorthand if you do not want to add the “info”
property manually.

```{qml}
InfoCombo {
    width: parent.width
    label: "Food preference"

    InfoComboSection {
        placeAtTop: true
        title: "Food types"
        text: "We provide different kinds of food."
    }

    menu: ContextMenu {
        MenuItem {                  // define options either like this
            text: "Vegetarian"
            property string info: "Vegetarian food does not have any meat."
        }
        InfoMenuItem {              // or like this
            text: "Vegan"
            info: "Vegan food is completely plant-based."
        }
    }

    InfoComboSection {
        placeAtTop: false
        title: "What about meat?"
        text: "We don't provide any meat."
    }
}
```

## Screenshots

TBD.

## How to use

You do not need to clone this repository if you only intend to use the module in
another project. Simply download the
[latest release bundle](https://github.com/Pretty-SFOS/opal-infocombo/releases/latest).

### Setup

Follow the main documentation for installing Opal modules
[here](https://github.com/Pretty-SFOS/opal/blob/main/README.md#using-opal).

### Configuration

See [`doc/gallery.qml`](doc/gallery.qml) for an example. Copy the file to get
started.

### Documentation

Extensive documentation is included in the release bundle and can be added to
QtCreator via Extras → Settings → Help → Documentation → Add.

## License

    Copyright (C) 2023  Mirian Margiani
    Program: opal-infocombo

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
