

qt_add_qml_module(my_module
    STATIC
    URI my_module
    VERSION 1.0
    QML_FILES MyTestButton.qml
)

target_link_libraries(my_module
    PRIVATE Qt6::Quick)
