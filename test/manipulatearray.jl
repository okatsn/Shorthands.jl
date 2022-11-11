@testset "rmkey!" begin
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
    rmkey!(v, r"\_\d+(hr|d)")
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

    v = deepcopy(v0)
    rmkey!(v, Not(r"precip"))
    answer = [
        "precipitation",
        "precipitation_1hr",
        "precipitation_12hr",
        "precipitation_1d",
        "precipitation_2d",
        "precipitation_3d",
    ]
    @test isequal(sort(v),sort(answer) )

end
