"""
`depreport(path_to_proj_dot_toml)` prints unused packaged.

This function is inspired (and mostly the same) by the thread: https://discourse.julialang.org/t/tool-to-tell-if-a-package-has-unused-dependencies-or-using-unused-packages/36254
"""
function depreport(path_to_proj_dot_toml)
    deps = TOML.parsefile(path_to_proj_dot_toml)["deps"]
    for d in deps
        if !isdefined(Proj, Symbol(d))
            println("$d is not being used")
        end
    end
end

"""
`depreport()` is the shorthand of `depreport("Project.toml")`
"""
function depreport()
    depreport("Project.toml")
end
