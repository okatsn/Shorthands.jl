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
function ok_pkg_template(yourpkgname::String; destination="")
    if isempty(destination)
        destination = pwd()
    end

    dirtemp = mkpath("oktemptemp")
    _dirtemp(args...) = joinpath(dirtemp, args...)
    _dirtemp()

    stdfile = PkgTemplates.Readme().file

    dst = _dirtemp("OkREADME.md") # what ever the name is OK since it will be removed
    # cp(stdfile, _dirtemp("OkREADME1.md"); force=true) # original file

    original = open(stdfile, "r") do io
        read(io, String)
    end

    # # Your README.md template #SETME
    myreadme = """
    $original

    ## Instruction


    """

    open(dst, "a+") do io
        write(io, myreadme)
    end

    pluginReadme = PkgTemplates.Readme(; file=dst, destination="README.md")

    t = Template(;
    user="okatsn",
    dir=destination,
    julia=v"1.6",
    plugins=[
        Git(; manifest=false),
        GitHubActions(),
        Codecov(), # https://about.codecov.io/
        Coveralls(), # https://coveralls.io/
        Documenter{GitHubActions}(),
        pluginReadme
    ],
    # # Your Documenter template #SETME
    pages=[
        "Home" => "index.md",
        "Examples" => "examples/examples.md",
        "Exported Functions" => "functions.md",
        "Models" =>
                    ["Model 1" => "models/model1.md",
                     "Model 2" => "models/model2.md"],
        "Reference" => "reference.md",
        ] # https://documenter.juliadocs.org/stable/man/guide/#Adding-Some-Docstrings
    ) # https://www.juliabloggers.com/tips-and-tricks-to-register-your-first-julia-package/


    t(yourpkgname) # create template
    rm(dirtemp; recursive=true)
end
