"""
`round_step(x, step)` round `x` to nearest `step`.
`round_step` takes keyword arguments that `round` takes in rounding.

# Example
- `round_step(12.2, 0.25)` round to nearest 0.25
- `round_step(12.2, 0.25; sigdigits=5)` is equivalent to `round(x / step; sigdigits=5) * step`


"""
function round_step(x, step; kwargs...)
    ans = round(x / step; kwargs...) * step
    return ans
end
