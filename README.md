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

Nevertheless in the last step from 2d surface mesh to a 3D Delaunay tetrahedralized volume mesh A) the triangulation with [Tetgen](https://github.com/ufz/tetgen) might fail as well as well as B) the generation of a grid hierarchy might fail. The user will be issued an error message indicating the nature of the problem which is of type A or B.

## Mesh generation scripts
The script `build.sh` shall be used for generation of these meshes with a soma connection and `build_y.sh` for generation of meshes from [Y-branch generator](https://github.com/stephanmg/Branch-Generator).
