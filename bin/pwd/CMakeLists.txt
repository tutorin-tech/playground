add_executable(pwd
  pwd.c
)

target_compile_options(pwd PRIVATE
  -include ${CMAKE_CURRENT_SOURCE_DIR}/../../bsd_compat/include/bsd_compat.h
)
target_compile_options(pwd PRIVATE -Wall -Wextra -Wno-unused-parameter)
