"""
`rmkey!(v::Vector, expr::Regex)`
"""
function rmkey!(v::Vector, expr::Regex)
    ind = occursin.(expr, v)
    deleteat!(v, ind)
end

"""
Supports `InvertedIndex`. E.g.,
```julia
v = [
    "hour",
    "air_temperature",
    "precipitation",
    "solar_radiation",
]

rmkey!(v, Not(r"precipitation"))
```
"""
function rmkey!(v, expr::InvertedIndex{Regex})
    ind = occursin.(expr.skip, v)
    deleteat!(v, .!ind)
end
