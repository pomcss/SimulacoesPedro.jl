using SimulacoesPedro
using Test

@testset "SimulacoesPedro.jl" begin
    data = Data()
    p = initial_point(data)
    @test utotal(p,data) ≈ utotal2(p,data)
end
