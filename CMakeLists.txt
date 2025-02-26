cmake_minimum_required(VERSION 3.16)

project(getting-started VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Sql)

qt_standard_project_setup()

qt_add_executable(appgetting-started
    main.cpp
)

qt_add_qml_module(appgetting-started
    URI getting-started
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES DefaultPage.qml
        QML_FILES IdentityPage.qml
        QML_FILES DatabasePage.qml
        QML_FILES ListViewPage.qml
        SOURCES ListModel.hpp
        QML_FILES SimpleListViewPage.qml
        QML_FILES MyTabBar.qml
        SOURCES sqlquerymodelbourrin.h
        SOURCES DbConnection.hpp
        QML_FILES MyTabbedPages.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appgetting-started PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appgetting-started
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appgetting-started
    PRIVATE Qt6::Quick Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appgetting-started
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
