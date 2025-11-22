cmake_minimum_required(VERSION 3.16)
project(Squirrel LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_PREFIX_PATH "D:/Qt/6.10.0/mingw132_64") # Qt 6.10.0 MinGW 13.2.0 路径

# 查找Qt模块
find_package(Qt6 COMPONENTS Core Quick Widgets Network REQUIRED)

# 源文件
set(SOURCES
    src/main.cpp
)

# QML和资源文件
set(RESOURCES
    qml.qrc
)

# 添加可执行文件
add_executable(Squirrel ${SOURCES} ${RESOURCES})

# 链接Qt库
target_link_libraries(Squirrel PRIVATE Qt6::Core Qt6::Quick Qt6::Widgets Qt6::Network)

# 复制QML文件到构建目录（开发时使用）
add_custom_command(TARGET Squirrel POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_SOURCE_DIR}/qml $<TARGET_FILE_DIR:Squirrel>/qml
)
