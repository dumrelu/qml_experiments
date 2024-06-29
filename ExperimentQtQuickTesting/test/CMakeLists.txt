
find_package(Qt6 6.2 COMPONENTS QuickTest REQUIRED)


#[[The test harness scans the specified source directory recursively
for "tst_*.qml" files. By default, it looks in the current directory,
which is usually where the executable is. This command makes it look
in the project's source directory instead.]]
add_definitions(-DQUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")

add_executable(qml_tests test_main.cpp setup.h setup.cpp tst_test1.qml)

add_test(NAME qml_tests COMMAND qml_tests)

target_link_libraries(
    qml_tests
    PRIVATE
        Qt6::QuickTest Qt6::Qml my_moduleplugin
)
