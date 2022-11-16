"""
`rmkey!(v::Vector, expr::Regex)` delete keys `occursin` `v` matching `expr`.
"""
function rmkey!(v::Vector, expr::Regex)
    ind = occursin.(expr, v)
    deleteat!(v, ind)
    return v
end

"""
`rmkey(v::Vector, expr::Regex)`
See `rmkey!`
"""
function rmkey(v::Vector, expr::Regex)
    ind2rm = occursin.(expr, v)
    return v[.!ind2rm]
end

"""
`rmkey(v, expr::InvertedIndex{Regex})`
See `rmkey!`.
"""
function rmkey(v, expr::InvertedIndex{Regex})
    ind2keep = occursin.(expr.skip, v)
    return v[ind2keep]
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
