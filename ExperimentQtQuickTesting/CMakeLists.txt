cmake_minimum_required(VERSION 3.16)

project(ExperimentQtQuickTesting VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

enable_testing()

add_subdirectory(my_module/)
add_subdirectory(test/)

qt_add_executable(appExperimentQtQuickTesting
    main.cpp
)

qt_add_qml_module(appExperimentQtQuickTesting
    URI ExperimentQtQuickTesting
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(appExperimentQtQuickTesting PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appExperimentQtQuickTesting
    PRIVATE Qt6::Quick my_moduleplugin)

qt_import_qml_plugins(appExperimentQtQuickTesting)

install(TARGETS appExperimentQtQuickTesting
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
