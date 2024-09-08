

qt_add_qml_module(my_module
    STATIC
    NO_GENERATE_PLUGIN_SOURCE
    NO_PLUGIN_OPTIONAL
    URI my_module
    VERSION 1.0
    QML_FILES MyTestButton.qml
    CLASS_NAME MyPlugin
    PLUGIN_TARGET my_moduleplugin
)

target_link_libraries(my_module
    PRIVATE Qt6::Quick)

target_sources(my_moduleplugin PRIVATE myplugin.h myplugin.cpp)
