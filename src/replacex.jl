"""
`replacex(content, p...::Pair)` replace `content` with pairs of strings.
Currently, `replace` supports only one string substitution (i.e., `replace(c, "hello" => "world")`)

"""
function replacex(content, prs...; kwargs...)
    for p in prs
        content = replace(content, p; kwargs...)
    end
    return content
end
