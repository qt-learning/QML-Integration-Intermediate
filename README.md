# QML & C++ Integration Intermediate

Welcome to the repository for the course "QML & C++ Integration Intermediate" on Qt Academy.

> Get the full learning experience by enrolling in the course on [Qt Academy](https://www.qt.io/academy/course-catalog?q=#qml-cpp-integration-intermediate)

> You can also find the course playlist on the [Qt YouTube channel](https://www.youtube.com/playlist?list=PLizsthdRd0Yw42WozwWzLKScKnmYfF-Rs)

## What You'll Learn

- **Creating and exposing C++ singletons to QML** using QML_SINGLETON, including handling non-default constructible singletons with custom `create()` functions.

- **Defining C++ enums for use in QML** via QML_ENUM, and binding QML properties to enum values.

- **Controlling QML object creation from C++** using QML_UNCREATABLE and setting initial properties with `setInitialProperties()`.

- **Using QML_ANONYMOUS to hide base classes** while exposing derived class functionality through QML_ELEMENT inheritance.

Skill Level: Intermediate

## Getting Started

In this course, you will explore intermediate techniques for integrating C++ with QML, including singletons, enums, uncreatable types, and anonymous base classes. You'll learn how to leverage these patterns to build well-structured, maintainable Qt Quick applications with robust C++ backends.

The repository contains reference projects for each video section:

| Folder                                | Description                                                  |
| ------------------------------------- | ------------------------------------------------------------ |
| `QMLIntegrationIntermediate_Section2a` | C++ singleton exposed to QML via QML_SINGLETON               |
| `QMLIntegrationIntermediate_Section2b` | Non-default constructible singleton with custom `create()`   |
| `QMLIntegrationIntermediate_Section3`  | C++ enums exposed to QML via QML_ENUM with property bindings |
| `QMLIntegrationIntermediate_Section4`  | QML_UNCREATABLE with initial properties set from C++         |
| `QMLIntegrationIntermediate_Section5`  | QML_ANONYMOUS base class with QML_ELEMENT derived class      |

Note: The projects are not required to complete the course, but are provided as a reference to help you understand the concepts discussed.

## Prerequisites

Before getting started, you should be familiar with Qt Quick fundamentals and basic QML/C++ integration. Consider first exploring the full [QML & C++ Integration](https://www.qt.io/academy/course-catalog?q=#qml-cpp-integration) learning path on Qt Academy, which provides the foundational knowledge needed to get the most from this course.

## Instructions

To get started with this project, you will need to have Qt (6.7 or later) and an IDE (e.g., Qt Creator) installed on your computer. You can download Qt and Qt Creator from the [Qt.io website](https://qt.io).

Once you have Qt and an IDE installed, head over to [Qt Academy](https://academy.qt.io) and follow along with the course videos.

To run any project in Qt Creator:

1. Navigate to the project folder
2. Open the `CMakeLists.txt` file
3. Build and run the project

## Resources

If you need additional help, the following resources may be helpful:

- Qt Documentation - Integrating QML and C++: https://doc.qt.io/qt-6/qtqml-cppintegration-overview.html
- Qt Documentation: https://doc.qt.io
- Qt Forum: https://forum.qt.io
- Qt Academy: https://qt.io/academy

## Licensing Information

```
Copyright (C) 2026 Qt Group.
SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
```

This course demonstrates intermediate techniques for integrating C++ with QML to build well-structured Qt Quick applications.

### Terms and Conditions

If you, your employer, or the legal entity you act on behalf of hold commercial license(s) with a Qt Group entity, this software package constitutes Pre-Release Code under the Qt License/Frame Agreement governing those licenses, and that agreement's terms and conditions govern your access and use of this software package.

This software package may provide links or access to third party libraries or code (collectively "Third-Party Software") to implement various functions. Use or distribution of Third-Party Software is discretionary and in all respects subject to applicable license terms of applicable third-party right holders.
