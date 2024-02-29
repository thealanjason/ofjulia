import Pkg
Pkg.activate(".")
Pkg.instantiate()

using OpenFOAM_com_jll

cd("synthetic-slope-elliptic-hemisphere/")
## This following calls fail because the libraries used by the executables
## cannot find the WM_PROJECT_DIR path in the environment of the command
# run(gridToSTL())
# run(pMesh())
# run(makeFaMesh())
# # restore0dir
# rm("0", recursive=true)
# cp("0.orig", "0")
# run(releaseAreaMapping())
# run(faSavageHutterFoam())

## When we add the WM_PROJECT_DIR with the correct path to the Cmd env
## the calls work as expected

# This is the path the etc folder is searched for by OpenFOAM libraries
dirname(OpenFOAM_com_jll.openfoam_etc)
# So we set this path to the WM_PROJECT_DIR variable in the Julia script 
# and add it to the environment for each call
WM_PROJECT_DIR = dirname(OpenFOAM_com_jll.openfoam_etc) 
run(addenv(gridToSTL(), "WM_PROJECT_DIR"=>WM_PROJECT_DIR));
run(addenv(pMesh(), "WM_PROJECT_DIR"=>WM_PROJECT_DIR));
run(addenv(makeFaMesh(), "WM_PROJECT_DIR"=>WM_PROJECT_DIR));
# restore0dir
rm("0", recursive=true)
cp("0.orig", "0")
run(addenv(releaseAreaMapping(), "WM_PROJECT_DIR"=>WM_PROJECT_DIR));
run(addenv(faSavageHutterFoam(), "WM_PROJECT_DIR"=>WM_PROJECT_DIR));
