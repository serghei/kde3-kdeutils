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

add_definitions( -D_GNU_SOURCE -D_ISOC99_SOURCE )

include_directories(
  ${CMAKE_BINARY_DIR}
  ${KDE_INCLUDE_DIR}
  ${QT_INCLUDE_DIR}
)


##### knumber (static) ##########################

kde_add_library( knumber STATIC_PIC
  SOURCES knumber.cpp knumber_priv.cpp
)
