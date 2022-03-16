"""
Show all out put in julia.
See https://stackoverflow.com/questions/37107133/how-to-show-all-output-in-julia 
"""
function show_all(x)
    show(stdout, "text/plain", x)
end
