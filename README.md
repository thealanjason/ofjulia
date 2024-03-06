# OFJulia
This is an example repository to show usage of precompiled OpenFOAM applications through the [OpenFOAM_com_jll](https://github.com/JuliaBinaryWrappers/OpenFOAM_com_jll.jl) package from within Julia.

## Usage (Linux x86_64 ONLY for now)
1. Install Julia (if not yet installed) with the command `curl -fsSL https://install.julialang.org | sh`.
   This will install `juliaup` and will use it to install the latest version of `julia`.
3. Run the test case with the command `julia ofavalanche_test.jl`.
   This will take some time to finish. If no errors are thrown, the test case ran successfully :)


## What's the deal with OpenFOAM helper scripts/functions?
Although these are usability features, at the core they are just shell scripts.
For a simple explanation see [this blog post](https://damogranlabs.com/2020/10/runfunctions-a-quick-cheatsheet/). For detailed understanding, see the OpenFOAM source code [here](https://develop.openfoam.com/Development/openfoam/-/tree/master/bin/tools?ref_type=heads)

## How do we make it work?
See the `ofavalanche_test.jl` file. Here we try to mimic the `synthetic-slope-elliptic-hemisphere/Allrun-serial` shell script by directly calling the corresponding executables from the OpenFOAM_com_jll package.

### Allrun Shell Script
```
#!/bin/sh
cd "${0%/*}" || exit                            # Run from this directory
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions    # Tutorial run functions
#------------------------------------------------------------------------------

runApplication gridToSTL

if [ "$WM_LABEL_SIZE" = 64 ]
then
    echo "Skip tutorial - known issues with pMesh and 64-bit labels"
    echo End
    exit 0
elif command -v pMesh > /dev/null
then
    runApplication pMesh
else
    echo "Skip tutorial - no pMesh found"
    echo End
    exit 0
fi

runApplication makeFaMesh

# Restore initial fields
restore0Dir

runApplication releaseAreaMapping

runApplication $(getApplication)

#------------------------------------------------------------------------------
```

### ofavalanche_test.jl Julia Script
```
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
```

