add_executable(mkdir
  rm.c
)

target_include_directories(rm PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(rm PRIVATE bsd_compat)

target_compile_options(rm PRIVATE
  -include ${CMAKE_CURRENT_SOURCE_DIR}/../../bsd_compat/include/bsd_compat.h
)
target_compile_options(rm PRIVATE -Wall -Wextra -Wno-unused-parameter)
