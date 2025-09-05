add_executable(md5
  crc.c
  md5.c
)

find_package(PkgConfig REQUIRED)

pkg_check_modules(LIBMD REQUIRED IMPORTED_TARGET libmd)

target_include_directories(md5 PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(md5 PRIVATE bsd_compat)
target_link_libraries(md5 PRIVATE PkgConfig::LIBMD)

target_compile_options(md5 PRIVATE
  -include ${CMAKE_CURRENT_SOURCE_DIR}/../../bsd_compat/include/bsd_compat.h
)
target_compile_options(md5 PRIVATE -Wall -Wextra -Wno-unused-parameter)
