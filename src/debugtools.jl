"""
Code taken from: https://discourse.julialang.org/t/how-to-print-function-name-and-source-file-line-number/43486/4?fbclid=IwAR33bFPDFD_SLse6Q8mKE1N46rz6mE2q2ivR6Z0nIoHBWHf1ftb0tLOX_rY

# Example
```julia
function foo()
    @codelocation
end
```

```julia-repl
julia> foo()
Running function Main.foo at /home/lobianco/.julia/dev/BetaML/src/temp.jl:18
```

"""
macro codelocation()
    return quote
        st = stacktrace(backtrace())
        myf = ""
        for frm in st
            funcname = frm.func
            if frm.func != :backtrace && frm.func!= Symbol("macro expansion")
                myf = frm.func
                break
            end
        end
        println("Running function ", $("$(__module__)"),".$(myf) at ",$("$(__source__.file)"),":",$("$(__source__.line)"))
    end
end