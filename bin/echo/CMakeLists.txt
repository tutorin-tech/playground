add_executable(echo
  echo.c
)

target_compile_options(echo PRIVATE -Wall -Wextra -Wno-unused-parameter)
