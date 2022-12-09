# {{{PKG}}}{{#HAS_INLINE_BADGES}} {{#BADGES}}{{{.}}} {{/BADGES}}{{/HAS_INLINE_BADGES}}
{{^HAS_INLINE_BADGES}}

{{#BADGES}}
{{{.}}}
{{/BADGES}}
{{/HAS_INLINE_BADGES}}
{{#HAS_CITATION}}

## Citing

See [`CITATION.bib`](CITATION.bib) for the relevant reference(s).
{{/HAS_CITATION}}

!!! note
    This is a julia package created using `okatsn`'s preference, and this package is expected to be registered to [okatsn/OkRegistry](https://github.com/okatsn/OkRegistry) for CIs to work properly.

## Tips for connecting to remote
Connect to remote:
1. Switch to the local directory of this project ({{{PKG}}})
2. Add an empty repo {{{PKG}}}(.jl) on github (without anything!)
3. `git push origin main`
- It can be quite tricky, see https://discourse.julialang.org/t/upload-new-package-to-github/56783
More reading
Pkg's Artifact that manage an external dataset as a package
- https://pkgdocs.julialang.org/v1/artifacts/
- a provider for reposit data: https://github.com/sdobber/FA_data

## Hints for Documenter
Set `docs/make.jl` for example:
```julia
pages=[
    "Home" => "index.md",
    "Examples" => "examples/examples.md",
    "Exported Functions" => "functions.md",
    "Models" =>
                ["Model 1" => "models/model1.md",
                    "Model 2" => "models/model2.md"],
    "Reference" => "reference.md",
    ] 
```

For more information, see [this](https://documenter.juliadocs.org/stable/man/guide/#Adding-Some-Docstrings)
