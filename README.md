QMLIntegrationIntermediate_Section2a: Example to demonstrate a singleton created in C++ exposed to QML via QML_SINGLETON. Tested with Qt 6.7.0 MinGW 64-bit.

QMLIntegrationIntermediate_Section2b: Example to demonstrate a singleton created in C++ that does not have a default constructor. Overriden static create() function is used to create the nondefault constructible singleton. Tested with Qt 6.7.0 MinGW 64-bit.

QMLIntegrationIntermediate_Section3: Example of an enum created in C++ exposed to QML via QML_ENUM. Q_PROPERTY of this type created in C++ and used in QML. Property in QML bound to the enum value as well. Tested with Qt 6.7.0 MinGW 64-bit.

QMLIntegrationIntermediate_Section4: Example of a C++ class exposed to QML with as QML_UNCREATABLE. Initial properties for the object set in main.cpp with setInitialProperties(). Tested with Qt 6.7.0 MinGW 64-bit.

QMLIntegrationIntermediate_Section5: Example of QML_ANONYMOUS. Base class Counters in C++ created as a QML_ANONYMOUS that cannot be referred to in QML. BingoResults class that can be instantiated in QML via QML_ELEMENT inherits properties from the anonymous base class. Tested with Qt 6.7.0 MinGW 64-bit.
