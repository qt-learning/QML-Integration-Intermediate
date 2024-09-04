cmake_minimum_required(VERSION 3.16)

project(QMLIntegrationIntermediate_Section4 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appQMLIntegrationIntermediate_Section4
    main.cpp
)

qt_add_qml_module(appQMLIntegrationIntermediate_Section4
    URI QmlIntermediate
    VERSION 1.0
    DEPENDENCIES
        QtCore
    QML_FILES
        Main.qml
    SOURCES
        globals.h globals.cpp
        bingomodel.h bingomodel.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQMLIntegrationIntermediate_Section4 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQMLIntegrationIntermediate_Section4
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQMLIntegrationIntermediate_Section4
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQMLIntegrationIntermediate_Section4
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
