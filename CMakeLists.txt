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

cmake_minimum_required( VERSION 2.8 )


##### general package setup #####################

project( kdeutils )
set( PACKAGE kdeutils )
set( VERSION 3.6 )


##### features ##################################

option( WITH_ALL_FEATURES "Enable all possible features" OFF )


##### user requested modules ####################

option( BUILD_ALL "Build all" OFF )
option( BUILD_ARK "Build ark" ${BUILD_ALL} )
option( BUILD_KCALC "Build kcalc" ${BUILD_ALL} )


##### configure checks ##########################

include( ConfigureChecks.cmake )


##### kdeutils directories #################

kde_conditional_add_subdirectory( BUILD_ARK ark )
kde_conditional_add_subdirectory( BUILD_KCALC kcalc )


##### write configure files #####################

configure_file( config.h.cmake config.h @ONLY )
