#!/bin/bash

set -e

#casename=g.e22a06.G1850ECOIAF_JRA_PHYS_DEV.TL319_g17.scope_v1 ## need to make directory before running this script
casename=g.e22.GOMIPECOIAF_JRA-1p4-2018.TL319_g17.4p2z.001

remote_mach=thorodin.cgd.ucar.edu
#remote_mach=tungsten.cgd.ucar.edu

remote_dir=/project/webshare/projects/ocean-diagnostics-books/kristenk/${casename}


source activate cesm-exp

conda info --envs

jupyter-book clean _computed-notebooks/${casename}
jupyter-book build _computed-notebooks/${casename} --all

scp -r _computed-notebooks/${casename}/_build/html/* ${remote_mach}:${remote_dir}
