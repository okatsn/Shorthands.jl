module Shorthands

# Write your package code here.
include("show_all.jl")
export show_all

include("debugtools.jl")
export codelocation

using InvertedIndices
include("manipulatearray.jl")
export rmkey!
end
