message(STATUS "Extern: gmock 1.7.0")

set(gmock_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/local")
set(gmock_INCLUDE_DIR "${gmock_INSTALL_DIR}/include")
set(gmock_LIBRARY_DIR "${gmock_INSTALL_DIR}/lib")

ExternalProject_Add(extern_gmock
	PREFIX "${CMAKE_CURRENT_BINARY_DIR}/gmock"
	SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src_extern/gmock-1.7.0"
	# configure
	CMAKE_ARGS
		-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
		-DCMAKE_INSTALL_PREFIX=${gmock_INSTALL_DIR}
		-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
		-DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
		-DCMAKE_C_FLAGS_DEBUG=${CMAKE_C_FLAGS_DEBUG}
		-DCMAKE_C_FLAGS_RELEASE=${CMAKE_C_FLAGS_RELEASE}
		-DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
		-DCMAKE_CXX_FLAGS_DEBUG=${CMAKE_CXX_FLAGS_DEBUG}
		-DCMAKE_CXX_FLAGS_RELEASE=${CMAKE_CXX_FLAGS_RELEASE}
	# install
	INSTALL_DIR ${gmock_INSTALL_DIR}
	)

add_library(gmock STATIC IMPORTED)
set_target_properties(gmock
	PROPERTIES
		IMPORTED_LOCATION
			${gmock_LIBRARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}gmock${CMAKE_STATIC_LIBRARY_SUFFIX}
	)
add_dependencies(gmock extern_gmock)
include_directories(${gmock_INCLUDE_DIR})

