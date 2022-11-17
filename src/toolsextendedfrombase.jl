"""
`round_step(x, step)` round `x` to nearest `step`.
# Example
- `round_step(12.2, 0.25)` round to nearest 0.25
"""
function round_step(x, step)
    round(x / step) * step
end
