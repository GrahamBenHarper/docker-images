##############
# Base image #
##############
FROM rockylinux:9 AS base

# old Tobias approach to install LXDE, VNC server
#RUN yum update; \
#    yum -y install htop xterm nano; \
#    yum -y install openbox; \
#    yum -y install tightvnc-server; \
#    yum clean all

RUN yum -y install less epel-release environment-modules wget nano git
RUN yum -y install automake make cmake
RUN yum -y install gcc gcc-gfortran gcc-c++ python

RUN echo root:Docker | chpasswd

##############
# TPLs image #
##############
FROM base AS tpls

# failed so far: htop, blas-devel, lapack-devel
RUN yum -y install openmpi openmpi-devel hdf5 hdf5-devel hdf5-openmpi hdf5-openmpi-devel
RUN yum -y install netcdf netcdf-devel netcdf-openmpi-devel netcdf-openmpi
RUN yum -y install blas lapack boost boost-devel atlas atlas-devel

##############
# Tril image #
##############
FROM tpls AS trilinos

ARG TRILINOS_CONFIGFILE=do-configure-trilinos.sh
ARG TRILINOS_VERSION=13-4-1

WORKDIR /opt/trilinos/
#RUN wget -nv https://github.com/trilinos/Trilinos/archive/refs/tags/trilinos-release-$TRILINOS_VERSION.tar.gz
RUN git clone https://github.com/trilinos/Trilinos.git source

# extract trilinos source file
RUN mkdir /opt/trilinos/build
RUN mkdir /opt/trilinos/install
#RUN tar xfz /opt/trilinos/trilinos-release-$TRILINOS_VERSION.tar.gz
#RUN mv /opt/trilinos/Trilinos-trilinos-release-$TRILINOS_VERSION /opt/trilinos/source
#RUN rm -f /opt/trilinos/trilinos-release-$TRILINOS_VERSION.tar.gz

# copy configure script to build directory
COPY $TRILINOS_CONFIGFILE /opt/trilinos/build/do-configure-trilinos.sh

WORKDIR /opt/trilinos/build
RUN ./do-configure-trilinos.sh
RUN make -j4 && make install