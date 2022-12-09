"""
A quick package creater that does
```julia
t = Template(;
    ...
    ]
)

t("YourPackage")
```
but with my configurations.
"""
function ok_pkg_template()
    dirtemp = mkpath("oktemptemp")
    _dirtemp(args...) = joinpath(dirtemp, args...)
    _dirtemp()

    stdfile = PkgTemplates.Readme().file

    dst = _dirtemp("OkREADME.md")
    # cp(stdfile, _dirtemp("OkREADME1.md"); force=true) # original file

    original = open(stdfile, "r") do io
        read(io, String)
    end

    myreadme = """
    $original

    ## Instruction


    """

    open(dst, "a+") do io
        write(io, myreadme)
    end

    PkgTemplates.Readme(; file=dst, destination="README.md")




    rm(dst)
end
