export CC=gcc
export CXX=g++
export FC=gfortran
export F77=gfortran
INSTALLDIR=$PWD

########################################### installing CCProf  #########################
cd CCProf
sh papiBuildScript.sh
sh papiLibmonitorScript.sh
sh buildAnalyzer.sh
echo "export CCPROFDIR=$PWD" >> ~/.bashrc
