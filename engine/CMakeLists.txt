add_library(engine STATIC
    src/core/Application.cpp
)
target_include_directories(engine PUBLIC include)
target_link_libraries(engine PUBLIC SDL3::SDL3)
