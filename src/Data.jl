#
# Data for the simulation
#

using Parameters

@with_kw strict Data

    ε :: Float64 = 5.0
    σ :: Float64 = 0.5

    cutoff :: Float64 = 2.0
    bdim :: Float64 = 100.0

    N :: Int64 = 10_000

    # Data for computation
    ε4 :: Float64 = 4*ε
    σ6 :: Float64 = σ^6
    σ12 :: Float64 = σ^12

end
