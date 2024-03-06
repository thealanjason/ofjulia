import Pkg
Pkg.activate(".")
Pkg.instantiate()

using OpenFOAM_com_jll

cd("synthetic-slope-elliptic-hemisphere/")

run(gridToSTL())
run(pMesh())
run(makeFaMesh())
# restore0dir
cp("0.orig", "0")
run(releaseAreaMapping())
run(faSavageHutterFoam())

