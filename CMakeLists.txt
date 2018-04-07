cmake_minimum_required(VERSION 3.10)
project(minimal_parser CXX)

set(CMAKE_CXX_STANDARD 11)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

include_directories(
        /usr/local/include
        /opt/local/include
        ${CMAKE_SOURCE_DIR}
        ${CMAKE_BINARY_DIR}
)

link_directories(
        /opt/local/lib
)

find_package(Threads)
find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

# ------------------------------

BISON_TARGET(parser
        parser.yy
        ${CMAKE_CURRENT_BINARY_DIR}/parser.cc
        VERBOSE
        COMPILE_FLAGS "--defines --debug --language=C++"
        )

FLEX_TARGET(lexer
        scanner.ll
        ${CMAKE_CURRENT_BINARY_DIR}/scanner.cc
        COMPILE_FLAGS "-+"
        )
ADD_FLEX_BISON_DEPENDENCY(lexer parser)

add_executable(minimal_parser main.cc driver.cc ${FLEX_lexer_OUTPUTS} ${BISON_parser_OUTPUTS})

target_link_libraries(minimal_parser ${FLEX_LIBRARIES})