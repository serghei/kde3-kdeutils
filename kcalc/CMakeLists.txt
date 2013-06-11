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

add_subdirectory( knumber )

add_definitions( -D_ISOC99_SOURCE )

include_directories(
  ${CMAKE_CURRENT_BINARY_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/knumber
  ${CMAKE_BINARY_DIR}
  ${KDE_INCLUDE_DIR}
  ${QT_INCLUDE_DIR}
)


##### other data ################################

kde_install_icons( kcalc )
install( FILES kcalc.desktop DESTINATION ${XDG_APPS_INSTALL_DIR} )
install( FILES kcalc.kcfg DESTINATION ${KCFG_INSTALL_DIR} )
install( FILES kcalcui.rc DESTINATION ${DATA_INSTALL_DIR}/kcalc )
install( FILES kcalcrc.upd DESTINATION ${KCONF_UPDATE_INSTALL_DIR} )


##### kcalc (kdeinit) ###########################

kde_add_kdeinit_executable( kcalc AUTOMOC
  SOURCES
    kcalc.cpp kcalc_button.cpp kcalc_const_button.cpp
    kcalc_const_menu.cpp kcalc_core.cpp kcalcdisplay.cpp dlabel.cpp
    stats.cpp colors.ui general.ui constants.ui kcalc_settings.kcfgc
  LINK knumber-static kdeui-shared ${GMP_LIBRARY}
)
