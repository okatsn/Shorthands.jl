module Shorthands

# Write your package code here.
include("show_all.jl")
export show_all

include("debugtools.jl")
export codelocation

using InvertedIndices
include("manipulatearray.jl")
export rmkey!, rmkey

include("toolsextendedfrombase.jl")
export round_step

using Aqua
include("projanalysis.jl")
export depreport

include("replacex.jl")
export replacex

using PkgTemplates
include("mypkgtemplates.jl")
export ok_pkg_template
end
