#!/bin/bash
## test non-VR mesh generation with new soma (polygon-polygon connection) connect strategy

# a list of files to generate
arr=(0-2a_original)

# function to check exit status
function check_exit() {
    if [ "$1" -eq 0 ]; then
      echo " successful."
    else
      echo " failed!"
      exit 2
    fi
}

# get neuromorpho REST API
curl -LO "https://raw.github.com/NeuroBox3D/neuromorpho/master/get_swc.py"
curl -LO "https://raw.github.com/NeuroBox3D/neuromorpho/master/neuromorpho.py"

# iterate over the files and regularize, generate grid and collect triangle intersections
for i in "${arr[@]}"
do
   echo "Retrieving SWC file..."
   python get_swc.py --name "$i"
   check_exit $?

   echo "Regularizing... "
   ../../bin/ugshell -call "test_import_swc_and_regularize_var(\"${i}.swc\", 1.0)"
   check_exit $?

   echo "Grid generation..."
   #../../bin/ugshell -call "create_branches_from_swc(\"new_strategy.swc\", 0.5, 0)"
   ../../bin/ugshell -call "test_import_swc_general_var(\"new_strategy.swc\", false, 0.5, true, 8,1, true, 1.0, false, false, \"identity\", -1)"
   check_exit $?

   echo "Check for triangle intersections..."
   #../../bin/ugshell -call "print('Number of triangles intersection: ' .. GetNumberOfTriangleIntersections(\"after_tetrahedralize_soma.ugx\", 0.1, false))"
   ../../bin/ugshell -call "print('Number of triangles intersection: ' .. GetNumberOfTriangleIntersections(\"after_tetrahedralize_soma_and_before_fix_axial_parameters.ugx\", 0.1, false))"
   check_exit $?
done
