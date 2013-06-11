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

add_subdirectory( pics )

add_definitions( -D_LARGEFILE64_SOURCE )

include_directories(
  ${CMAKE_CURRENT_BINARY_DIR}
  ${CMAKE_BINARY_DIR}
  ${KDE_INCLUDE_DIR}
  ${QT_INCLUDE_DIR}
)


##### other data ################################

kde_install_icons( ark )
install( FILES ark.desktop DESTINATION ${XDG_APPS_INSTALL_DIR} )
install( FILES ark.kcfg DESTINATION ${KCFG_INSTALL_DIR} )
install( FILES ark_part.desktop DESTINATION ${SERVICES_INSTALL_DIR} )
install( FILES arkui.rc ark_part.rc ark_part_readonly.rc DESTINATION ${DATA_INSTALL_DIR}/ark )


##### libarkpart (module) #######################

kde_add_kpart( libarkpart AUTOMOC
  SOURCES
    ark_part.cpp arkfactory.cpp zip.cpp tar.cpp filelistview.cpp
    arch.cpp lha.cpp compressedfile.cpp zoo.cpp rar.cpp ar.cpp
    arkutils.cpp archiveformatdlg.cpp arkwidget.cpp searchbar.cpp
    addition.ui extraction.ui general.ui arkviewer.cpp sevenzip.cpp
    extractiondialog.cpp ace.cpp tarlistingthread.cpp
  LINK ark_common-static kparts-shared
  DESTINATION ${PLUGIN_INSTALL_DIR}
)


##### ark (kdeinit) #############################

kde_add_kdeinit_executable( ark AUTOMOC
  SOURCES
    main.cpp arkapp.cpp mainwindow.cpp
  LINK ark_common-static kparts-shared
)


##### ark_common (static) #######################

kde_add_library( ark_common STATIC_PIC AUTOMOC
  SOURCES
    settings.kcfgc archiveformatinfo.cpp
)
