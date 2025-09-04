add_executable(cat
  cat.c
)

target_link_libraries(cat PRIVATE bsd_compat)

target_compile_options(cat PRIVATE
  -include ${CMAKE_CURRENT_SOURCE_DIR}/../../bsd_compat/include/bsd_compat.h
)
target_compile_options(cat PRIVATE -Wall -Wextra -Wno-unused-parameter)
