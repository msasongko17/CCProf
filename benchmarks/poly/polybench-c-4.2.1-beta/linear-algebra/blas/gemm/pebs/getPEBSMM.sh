#!/usr/bin/bash
BenchmarkOutDir=/home/proy/cTool/benchmarks_results/MM/cmiss_test_1
MemToolDir=/home/proy/cTool/MemTool
mkdir -p  $BenchmarkOutDir
#without Dynamic
mkdir -p $BenchmarkOutDir/SMT_NotDynamic

ROOTDIR=/home/proy/cTool/MemTool
LIBMONITORDIR=$ROOTDIR/libmonitor/libmonitor
PAPIDIR=$ROOTDIR/PAPI/PAPI
export LD_LIBRARY_PATH=$PAPIDIR/src/libpfm4/lib
echo "LD_LIBRARY_PATH"
echo $LD_LIBRARY_PATH
echo "Binding to SMT"

export OMP_PLACES="{0},{32},{1},{33},{2},{34},{3},{35},{4},{36},{5},{37},{6},{38},{7},{39}"

isSMT=SMT
#sh getPEBSScript.sh benchmarkListRodiniaTest benchmarkRunCommandRodinia16threadsTest $BenchmarkOutDir/SMT_NotDynamic $LIBMONITORDIR $ROOTDIR $isSMT

GOMP_CPU_AFFINITY="0-7"

#sh $MemToolDir/gompBindNONSMT.sh
mkdir -p $BenchmarkOutDir/NONSMT_NotDynamic
echo "Binding to NON SMT"
isSMT=NONSMT
sh getPEBSScript.sh benchmarkListMMTest benchmarkRunCommandMM8threadsTest $BenchmarkOutDir/NONSMT_NotDynamic $LIBMONITORDIR $ROOTDIR $isSMT

