# Grids for general computation

Tools for generating 3D meshes (.ugx) from 1D linear graphs (.swc) of neuronal morphologies stored in the *NeuroMorpho.org* database.

[![Build Status Linux](https://travis-ci.org/stephanmg/non-vr-grids.svg?branch=development)](https://travis-ci.org/stephanmg/non-vr-grids)
[![Build Status OSX](https://travis-ci.org/stephanmg/non-vr-grids.svg?branch=development)](https://travis-ci.org/stephanmg/non-vr-grids)
[![Build status Windows](https://ci.appveyor.com/api/projects/status/or23w3hgfqxc89is?svg=true)](https://ci.appveyor.com/project/stephanmg/non-vr-grids)

## Requirements

The following conditions are required for the input cells in .swc format to generated 2d Delaunay-triangulated surface meshes:
1. Acylic
2. Bifurcations n <= 4
3. Neurites should not overlap at soma surface
4. Neurites should not start within soma 
5. Neurite branches should not overlap

If any of the conditions is violated (1.-3.) the user will be issued an error message during grid generation.
If the last two conditions (4.-5.) are violated the user will be issued a warning instead as grid generation can automatically fix these conditions.

## Build instructions
Follow installation instructions for *ug4* from [here](https://github.com/ug4/ughub) 
with the plugin *neuro_collection* installed and enabled from [there](https://github.com/NeuroBox/neuro_collection).
For Windows installations a working WSL or Cygwin environment is required to 
run the VR pipeline script (Sh/Bash). Currently a platform independent 
VRL-Studio project is developed and found [here](https://github.com/c2m2/VRL-VRN-Generator).

Nevertheless in the last step from 2d surface mesh to a 3D Delaunay tetrahedralized volume mesh A) the triangulation with [Tetgen](https://github.com/ufz/tetgen) might fail as well as well as B) the generation of a grid hierarchy might fail. The user will be issued an error message indicating the nature of the problem which is of type A or B.

## Mesh generation scripts
The repository contains currently two build scripts:
1.  The script `build.sh` shall be used for generation of these meshes with a soma connection 
2.  The script `build_y.sh` shall be used for generation of meshes from input 1D SWC files generated via the [Y-branch generator](https://github.com/stephanmg/Branch-Generator) as well as for meshes which do not require a soma or do not contain a soma.
