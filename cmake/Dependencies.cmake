CPMAddPackage(
    NAME SDL3
    GITHUB_REPOSITORY libsdl-org/SDL
    GIT_TAG release-3.4.20
    OPTIONS
        "SDL_SHARED OFF"
        "SDL_STATIC ON"
        "SDL_TEST_LIBRARY OFF"
        "SDL_EXAMPLES OFF"
    SYSTEM YES
)

CPMAddPackage(
    NAME EnTT
    GITHUB_REPOSITORY skypjack/entt
    GIT_TAG v4.0.0
    SYSTEM YES
)

CPMAddPackage(
    NAME glaze
    GITHUB_REPOSITORY stephenberry/glaze
    GIT_TAG v9.1.0
    SYSTEM YES
)

CPMAddPackage(
    NAME lua
    GITHUB_REPOSITORY lua/lua
    GIT_TAG v5.4.8
    DOWNLOAD_ONLY YES
)

file(GLOB LUA_SOURCES ${lua_SOURCE_DIR}/*.c)
list(REMOVE_ITEM LUA_SOURCES
    ${lua_SOURCE_DIR}/lua.c
    ${lua_SOURCE_DIR}/luac.c
    ${lua_SOURCE_DIR}/onelua.c
    ${lua_SOURCE_DIR}/ltests.c
)
add_library(lua STATIC ${LUA_SOURCES})
target_include_directories(lua SYSTEM PUBLIC ${lua_SOURCE_DIR})
if(UNIX)
    target_compile_definitions(lua PRIVATE LUA_USE_POSIX)
    target_link_libraries(lua PUBLIC m)
endif()

CPMAddPackage(
    NAME sol2
    GITHUB_REPOSITORY ThePhD/sol2
    GIT_TAG v3.5.0
    SYSTEM YES
)

CPMAddPackage(
    NAME miniaudio
    GITHUB_REPOSITORY mackron/miniaudio
    GIT_TAG 0.11.26
    DOWNLOAD_ONLY YES
)
add_library(miniaudio INTERFACE)
target_include_directories(miniaudio SYSTEM INTERFACE ${miniaudio_SOURCE_DIR})

CPMAddPackage(
    NAME spdlog
    GITHUB_REPOSITORY gabime/spdlog
    GIT_TAG v1.17.0
    SYSTEM YES
)

CPMAddPackage(
    NAME doctest
    GITHUB_REPOSITORY doctest/doctest
    GIT_TAG v2.5.3
    SYSTEM YES
)
