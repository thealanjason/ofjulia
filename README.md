# OFJulia
This is an example repository to show usage of OpenFOAM through the OpenFOAM_com_jll

## What's the deal with OpenFOAM helper scripts/functions?
Although these are usability features, at the core they are just shell scripts
For a simple explanation see [this blog post](https://damogranlabs.com/2020/10/runfunctions-a-quick-cheatsheet/). For detailed understanding, see the OpenFOAM source code [here](https://develop.openfoam.com/Development/openfoam/-/tree/master/bin/tools?ref_type=heads)

## How do we make it work?
See the `ofavalanche_test.jl` file. Here we try to mimic the `synthetic-slope-elliptic-hemisphere/Allrun-serial` shell script by directly calling the corresponding executables from the OpenFOAM_com_jll package.