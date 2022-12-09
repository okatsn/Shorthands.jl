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
