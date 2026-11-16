add_executable(tests
    main.test.cpp
    sanity.test.cpp
)
target_link_libraries(tests PRIVATE engine doctest::doctest)

add_test(NAME unit COMMAND tests)
