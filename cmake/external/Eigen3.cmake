GetCompilers()

set(EIGEN_INCLUDE_DIR ${THIRD_PARTY_INCLUDE_DIR}/eigen)
include(ExternalProject)
ExternalProject_Add(
	Eigen3
	PREFIX ${CMAKE_BINARY_DIR}/Eigen3
	DOWNLOAD_DIR ${THIRD_PARTY_DIR}/Eigen3
	URL https://bitbucket.org/eigen/eigen/get/3.2.8.tar.bz2
	URL_MD5 9e3bfaaab3db18253cfd87ea697b3ab1
#	FIXME: http://eigen.tuxfamily.org/bz/show_bug.cgi?id=1445
#	URL https://bitbucket.org/eigen/eigen/get/3.3.4.tar.bz2
#	URL_MD5 a7aab9f758249b86c93221ad417fbe18
	CMAKE_ARGS -DEIGEN_INCLUDE_INSTALL_DIR:PATH=${EIGEN_INCLUDE_DIR}
		-DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}${CMAKE_DEFINITIONS}
		-DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}${CMAKE_DEFINITIONS}
		-DCMAKE_C_COMPILER:STRING=${C_COMPILER}
		-DCMAKE_CXX_COMPILER:STRING=${CXX_COMPILER}
		-DEIGEN_BUILD_PKGCONFIG=0
	)

add_dependencies(libshogun Eigen3)

UNSET(C_COMPILER)
UNSET(CXX_COMPILER)
