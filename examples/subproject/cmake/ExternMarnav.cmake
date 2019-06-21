include(ExternalProject)
ExternalProject_Add(extern_marnav
	PREFIX "${CMAKE_CURRENT_BINARY_DIR}/marnav"
	SOURCE_DIR "${MARNAV_SOURCE_DIR}"
	# configure
	CMAKE_ARGS
		-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
		-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
		-DCMAKE_INSTALL_PREFIX=${LOCAL_INSTALL_PREFIX}
		-DCMAKE_BUILD_TYPE=Release
		-DENABLE_TESTS=NO
		-DENABLE_TOOLS=NO
		-DENABLE_EXAMPLES=NO
	# install
	INSTALL_DIR ${LOCAL_INSTALL_PREFIX}
	)

add_library(marnav::marnav STATIC IMPORTED)
file(MAKE_DIRECTORY ${LOCAL_INSTALL_PREFIX}/include)
set_target_properties(marnav::marnav
	PROPERTIES
		IMPORTED_LOCATION
			${LOCAL_INSTALL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}marnav${CMAKE_STATIC_LIBRARY_SUFFIX}
		INTERFACE_INCLUDE_DIRECTORIES
			${LOCAL_INSTALL_PREFIX}/include
	)

add_dependencies(marnav::marnav extern_marnav)
