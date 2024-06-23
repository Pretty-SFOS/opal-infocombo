<!--
SPDX-FileCopyrightText: 2023 Mirian Margiani
SPDX-License-Identifier: GFDL-1.3-or-later
-->

# Changelog

## 2.1.0 (2024-06-23)

- updated translations: Russian, Spanish, Chinese
- addded support for changing options from the details page
- this can be disabled using the new `allowChanges` property in `InfoCombo`
- updated documentation regarding links:
    - hyperlinks are only allowed in custom sections (`InfoComboSection`) but
      not in option descriptions
    - this is a technical limitation in the Silica `TextSwitch` component
      and cannot easily be solved here

## 2.0.0 (2023-06-29)

- moved the ready-made Attribution component from
  `Opal/<module>/Opal<module>Attribution.qml` to `Opal/Attributions/Opal<module>Attribution.qml`
- you no longer have to import all Opal modules on the “About” page to attribute them,
  simply use `import "../modules/Opal/Attributions"` to access all attributions

## 1.1.0 (2023-06-17)

- updated translations: Swedish, Spanish
- fixed `OpalInfoComboAttribution` so that it correctly imports `Opal.About`
- fixed color of links in descriptions
- added `linkHandler` property and `linkActivated` signal to `InfoCombo`
- default link handler is `Qt.openUrlExternally`

## 1.0.0 (2023-06-03)

- first fully-featured and stable release
