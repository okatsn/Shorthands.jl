"""
# Example
```julia
using YourPackage
depreport(YourPackage)
```

See the thread: https://discourse.julialang.org/t/tool-to-tell-if-a-package-has-unused-dependencies-or-using-unused-packages/36254
"""
function depreport(YourPackage)
    Aqua.test_stale_deps(YourPackage)
end

# """
# `depreport()` is the shorthand of `depreport("Project.toml")`
# """
# function depreport()
#     depreport("Project.toml")
# end
