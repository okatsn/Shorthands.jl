# # Your Documenter template #This is UNUSED
pages=[
    "Home" => "index.md",
    "Examples" => "examples/examples.md",
    "Exported Functions" => "functions.md",
    "Models" =>
                ["Model 1" => "models/model1.md",
                    "Model 2" => "models/model2.md"],
    "Reference" => "reference.md",
    ] # https://documenter.juliadocs.org/stable/man/guide/#Adding-Some-Docstrings




# # See PkgTemplates/src/plugin.jl
const DEFAULT_TEMPLATE_DIR = Ref{String}(joinpath(dirname(pathof(Shorthands)), "mypkgtemplates")) # KEYNOTE: Check the package name and folder name if moved to other package
"""
Return a path relative to the default template file directory
(`Shorthands/mypkgtemplates`).
"""
mypkgtemplate_dir(paths::AbstractString...) = joinpath(DEFAULT_TEMPLATE_DIR[], paths...)

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

Template files are put under: $(DEFAULT_TEMPLATE_DIR[]), just like that of "PkgTemplates/templates".
"""
function ok_pkg_template(yourpkgname::String; destination="")
    if isempty(destination)
        destination = pwd()
    end

    t = Template(;
    user="okatsn",
    dir=destination,
    julia=v"1.6",
    plugins=[
        Git(; manifest=false),
        GitHubActions(;file = mypkgtemplate_dir("github", "workflows", "CI.yml")), # see PkgTemplates/src/plugins/ci.jl
        Codecov(), # https://about.codecov.io/
        Documenter{GitHubActions}(),
        PkgTemplates.Readme(; file=mypkgtemplate_dir("README.md"), destination="README.md"), # see PkgTemplates/src/plugins/readme.jl
        TagBot(;registry="okatsn/OkRegistry"), # see PkgTemplates/src/plugins/tagbot.jl
        # I use the template TagBot.yml in PkgTemplates directly.
        # If your registry is public, this is all you need to do.
        # For more information, see [here](https://github.com/JuliaRegistries/TagBot#custom-registries)
    ],

    ) # https://www.juliabloggers.com/tips-and-tricks-to-register-your-first-julia-package/


    t(yourpkgname) # create template

end
