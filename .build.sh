#!/bin/bash
## add good working cells here
cells=(37-4a)

echo "Testing non-VR use-case grids..."
## create meshes 
for i in "${cells[@]}"; do
  mkdir -p TestCell/${i}.CNG
  python get_swc.py --name ${i}
  ${TRAVIS_BUILD_DIR}/travis_root/ug4/bin/ugshell -call "test_import_swc_and_regularize_var(\"${i}.CNG.swc\")" &> /dev/null
 # ${TRAVIS_BUILD_DIR}/travis_root/ug4/bin/ugshell -call "test_import_swc_general_var(\"new_strategy.swc\", false, 0.5, true, 8,1, true, 1.0, false, false, \"identity\", -1)" &> /dev/null
done

# echo "Testing Y-branches.."
# ${TRAVIS_BUILD_DIR}/travis_root/ug4/bin/ugshell -call "create_branches_from_swc(\"$TRAVIS_BUILD_DIR/grids/Y_angle=90.0.swc\", 0.5, 0)"
