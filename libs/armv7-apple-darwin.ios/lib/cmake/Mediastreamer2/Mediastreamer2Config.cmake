############################################################################
# Mediastreamer2Config.cmake
# Copyright (C) 2015  Belledonne Communications, Grenoble France
#
############################################################################
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#
############################################################################
#
# Config file for the mediastreamer2 package.
# It defines the following variables:
#
#  MEDIASTREAMER2_FOUND - system has mediastreamer2
#  MEDIASTREAMER2_INCLUDE_DIRS - the mediastreamer2 include directory
#  MEDIASTREAMER2_LIBRARIES - The libraries needed to use mediastreamer2
#  MEDIASTREAMER2_CPPFLAGS - The compilation flags needed to use mediastreamer2
#  MEDIASTREAMER2_LDFLAGS - The linking flags needed to use mediastreamer2

if(NOT LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${CMAKE_CURRENT_LIST_DIR}/Mediastreamer2Targets.cmake")
endif()

if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	include("${EP_ortp_CONFIG_DIR}/ORTPConfig.cmake")
else()
	find_package(ORTP REQUIRED)
endif()
if(ON)
	if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
		include("${EP_bzrtp_CONFIG_DIR}/BZRTPConfig.cmake")
	else()
		find_package(BZRTP)
	endif()
endif()

get_filename_component(MEDIASTREAMER2_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
	set(MEDIASTREAMER2_INCLUDE_DIRS "${EP_ms2_INCLUDE_DIR}")
else()
	set(MEDIASTREAMER2_INCLUDE_DIRS "${MEDIASTREAMER2_CMAKE_DIR}/../../../include")
endif()
set(MEDIASTREAMER2_LIBRARIES mediastreamer_base mediastreamer_voip)
list(APPEND MEDIASTREAMER2_INCLUDE_DIRS ${ORTP_INCLUDE_DIRS})
list(APPEND MEDIASTREAMER2_LIBRARIES ${ORTP_LIBRARIES})
if(BZRTP_FOUND)
	list(APPEND MEDIASTREAMER2_INCLUDE_DIRS ${BZRTP_INCLUDE_DIRS})
	list(APPEND MEDIASTREAMER2_LIBRARIES ${BZRTP_LIBRARIES})
endif()
set(MEDIASTREAMER2_CPPFLAGS ${ORTP_CPPFLAGS})
set(MEDIASTREAMER2_LDFLAGS -framework CoreFoundation;-framework AudioToolbox;-framework CoreAudio;-framework Foundation;-framework QuartzCore;-framework OpenGLES;-framework UIKit;-framework AVFoundation;-framework CoreGraphics;-framework CoreMedia;-framework CoreVideo)
set(MEDIASTREAMER2_FOUND 1)
