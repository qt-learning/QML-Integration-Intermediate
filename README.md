# QML & C++ Integration Intermediate

This is the repo for the QML & C++ Integration Intermediate course on Qt Academy.

## Getting Started

The files provided are the demo apps created during the course. They provide a reference for the workflows covered in the course section.

## Instructions

To get started with this project, you will need to have Qt installed from the qt.io website. We Recommend using the QtCreator IDE in order to follow along with the content in the videos.

QMLIntegrationIntermediate_Section2a: Example to demonstrate a singleton created in C++ exposed to QML via QML_SINGLETON. Tested with Qt 6.7.0 MinGW 64-bit.

QMLIntegrationIntermediate_Section2b: Example to demonstrate a singleton created in C++ that does not have a default constructor. Overriden static create() function is used to create the nondefault constructible singleton. Tested with Qt 6.7.0 MinGW 64-bit.

QMLIntegrationIntermediate_Section3: Example of an enum created in C++ exposed to QML via QML_ENUM. Q_PROPERTY of this type created in C++ and used in QML. Property in QML bound to the enum value as well. Tested with Qt 6.7.0 MinGW 64-bit.

QMLIntegrationIntermediate_Section4: Example of a C++ class exposed to QML with as QML_UNCREATABLE. Initial properties for the object set in main.cpp with setInitialProperties(). Tested with Qt 6.7.0 MinGW 64-bit.

QMLIntegrationIntermediate_Section5: Example of QML_ANONYMOUS. Base class Counters in C++ created as a QML_ANONYMOUS that cannot be referred to in QML. BingoResults class that can be instantiated in QML via QML_ELEMENT inherits properties from the anonymous base class. Tested with Qt 6.7.0 MinGW 64-bit.

## Resources

If you need additional help, the following resources may be helpful:

- Qt Documentation: https://doc.qt.io
- Qt Forum: https://forum.qt.io
- Qt Academy: https://qt.io/academy

## Licensing Information

```
Copyright (C) 2026 Qt Group.
SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
```

This is a QML Integration Intermediate learning project demonstrating how to integrate C++ with QML.

### Terms and Conditions

If you, your employer, or the legal entity you act on behalf of hold commercial license(s) with a Qt Group entity, this software package constitutes Pre-Release Code under the Qt License/Frame Agreement governing those licenses, and that agreement's terms and conditions govern your access and use of this software package.

This software package may provide links or access to third party libraries or code (collectively "Third-Party Software") to implement various functions. Use or distribution of Third-Party Software is discretionary and in all respects subject to applicable license terms of applicable third-party right holders.

