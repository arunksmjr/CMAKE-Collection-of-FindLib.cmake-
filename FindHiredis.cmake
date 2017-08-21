# - Try to find the Lib library
# Once done this will define
#
#  LIBHIREDIS_FOUND - System has Hiredis
#  LIBHIREDIS_INCLUDE_DIR - The Hiredis include directory
#  LIBHIREDIS_LIBRARIES - The libraries needed to use Hiredis
#  LIBHIREDIS_DEFINITIONS - Compiler switches required for using Hiredis


# use pkg-config to get the directories and then use these values
# in the FIND_PATH() and FIND_LIBRARY() calls
#FIND_PACKAGE(PkgConfig)
#PKG_SEARCH_MODULE(PC_LIBHIREDIS libhiredis)

SET(LIBHIREDIS_DEFINITIONS ${PC_LIBHIREDIS_CFLAGS_OTHER})

FIND_PATH(LIBHIREDIS_INCLUDE_DIR hiredis/hiredis.h
   HINTS
   ${PC_LIBHIREDIS_INCLUDEDIR}
)

FIND_LIBRARY(LIBHIREDIS_LIBRARIES NAMES hiredis
   HINTS
   ${PC_LIBHIREDIS_LIBDIR}
)

FIND_LIBRARY(LIBEV_LIBRARIES NAMES ev
   HINTS
   "/usr/local/lib"
)

set(LIBHIREDIS_LIBRARIES ${LIBHIREDIS_LIBRARIES} "${LIBEV_LIBRARIES}")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibHiredis DEFAULT_MSG LIBHIREDIS_LIBRARIES LIBHIREDIS_INCLUDE_DIR)

MARK_AS_ADVANCED(LIBHIREDIS_INCLUDE_DIR LIBHIREDIS_LIBRARIES)
