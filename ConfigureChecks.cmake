#################################################
#
#  (C) 2012 Serghei Amelian
#  serghei (DOT) amelian (AT) gmail.com
#
#  Improvements and feedback are welcome
#
#  This file is released under GPL >= 2
#
#################################################

include( CheckIncludeFile )
include( CheckLibraryExists )
include( CheckTypeSize )


# find kdelibs
# FIXME should be more flexibile
set( CMAKE_MODULE_PATH "${CMAKE_INSTALL_PREFIX}/share/cmake" )
if( NOT EXISTS "${CMAKE_MODULE_PATH}/FindKDE3.cmake" )
  message( FATAL_ERROR
      "\n"
      "####################################################################\n "
      "${CMAKE_MODULE_PATH}/FindKDE3.cmake does not exists.\n "
      "Please pass corect CMAKE_INSTALL_PREFIX to cmake.\n"
      "####################################################################\n" )
endif( )
include( FindKDE3 )


# for kcalc
if( BUILD_KCALC )
  check_type_size( "unsigned long" SIZEOF_UNSIGNED_LONG BUILTIN_TYPES_ONLY )
  check_include_file( "ieeefp.h" HAVE_IEEEFP_H )
  check_include_file( "stdlib.h" HAVE_STDLIB_H )
  check_library_exists( m isinf "" HAVE_FUNC_ISINF )
  kde_search_library( GMP_LIBRARY gmp.h gmp )
endif( )
