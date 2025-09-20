add_executable(mkdir
  mkdir.c
)

target_include_directories(mkdir PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(mkdir PRIVATE bsd_compat)

target_compile_options(mkdir PRIVATE
  -include ${CMAKE_CURRENT_SOURCE_DIR}/../../bsd_compat/include/bsd_compat.h
)
target_compile_options(mkdir PRIVATE -Wall -Wextra -Wno-unused-parameter)
