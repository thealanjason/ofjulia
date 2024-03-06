# OFJulia
This is an example repository to show usage of precompiled OpenFOAM applications through the [OpenFOAM_com_jll](https://github.com/JuliaBinaryWrappers/OpenFOAM_com_jll.jl) package from within Julia.

## What's the deal with OpenFOAM helper scripts/functions?
Although these are usability features, at the core they are just shell scripts.
For a simple explanation see [this blog post](https://damogranlabs.com/2020/10/runfunctions-a-quick-cheatsheet/). For detailed understanding, see the OpenFOAM source code [here](https://develop.openfoam.com/Development/openfoam/-/tree/master/bin/tools?ref_type=heads)

## How do we make it work?
See the `ofavalanche_test.jl` file. Here we try to mimic the `synthetic-slope-elliptic-hemisphere/Allrun-serial` shell script by directly calling the corresponding executables from the OpenFOAM_com_jll package.

## Usage (Linux x86_64 ONLY for now)
1. Install Julia (if not yet installed) with the command `curl -fsSL https://install.julialang.org | sh`.
   This will install `juliaup` and will use it to install the latest version of `julia`.
3. Run the test case with the command `julia ofavalanche_test.jl`.
   This will take some time to finish. If no errors are thrown, the test case ran successfully :)
