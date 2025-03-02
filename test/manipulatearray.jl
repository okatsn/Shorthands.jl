using InvertedIndices
@testset "rmkey!/rmkey" begin
    v0 = [
        "hour",
        "air_temperature",
        "precipitation",
        "precipitation_1hr",
        "precipitation_12hr",
        "precipitation_1d",
        "precipitation_2d",
        "precipitation_3d",
        "pressure_CWB",
        "solar_radiation",
        "humidity_CWB",
        "windspeed_CWB",
    ]
    v = deepcopy(v0)
    expr = r"\_\d+(hr|d)"
    rmkey!(v, expr)
    answer = [
        "hour",
        "air_temperature",
        "precipitation",
        "pressure_CWB",
        "solar_radiation",
        "humidity_CWB",
        "windspeed_CWB",
    ]
    @test isequal(sort(v),sort(answer) )
    @test isequal(sort(rmkey(v0, expr)),sort(answer) )

    v = deepcopy(v0)
    iexpr = Not(r"precip")
    rmkey!(v, iexpr)
    answer = [
        "precipitation",
        "precipitation_1hr",
        "precipitation_12hr",
        "precipitation_1d",
        "precipitation_2d",
        "precipitation_3d",
    ]
    @test isequal(sort(v),sort(answer) )
    @test isequal(sort(rmkey(v0, iexpr)),sort(answer) )

end
