add_library(bsd_compat STATIC
  src/progname.c
)

target_include_directories(bsd_compat PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/include
  ${CMAKE_CURRENT_SOURCE_DIR}/src
)

target_compile_options(bsd_compat PRIVATE
  -include ${CMAKE_CURRENT_SOURCE_DIR}/include/confdefs.h
)
