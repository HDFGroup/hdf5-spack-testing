#!/bin/bash -l

rm *.cobaltlog *.error *.output

(cd /gpfs/jlse-fs0/users/<username>/arc-spack
  git pull
   . share/spack/setup-env.sh
    spack uninstall --all --dependents -y hdf5)

qsub -t 30 -n 1 -q arcticus_debug /gpfs/jlse-fs0/users/<username>/arc-test/arc-spack-test.bsub sargs

