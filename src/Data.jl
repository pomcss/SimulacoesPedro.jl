#
# Data for the simulation
#

using Parameters

@with_kw struct Data

    ε :: Float64 = 5.0
    σ :: Float64 = 0.5

    cutoff :: Float64 = 2.0
    bdim :: Float64 = 100.0

    N :: Int64 = 10_000

    # Data for computation
    nc :: Int64 = (bdim % cutoff == 0) ? trunc(Int64, bdim/cutoff) : trunc(Int64, bdim/cutoff + 1)
    ε4 :: Float64 = 4*ε
    ε24 :: Float64 = 24*ε
    σ6 :: Float64 = σ^6
    σ12 :: Float64 = σ^12
    cutoff2 :: Float64 = cutoff^2

end
