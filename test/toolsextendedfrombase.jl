@testset "round_step at toolsextendedfrombase.jl" begin
    testit = [
        (12.2, 0.25) => 12.25,
        (9527, 500)  => 9500.0,
        (0.29, 0.25)  => 0.25,
        (0.39, 0.25)  => 0.5,
    ]
    for ((x, step), ans) in testit
        @test round_step(x, step) == ans
    end

    for ((x, step), ans) in testit
        @test round_step(-x, step) == -ans
    end
end
