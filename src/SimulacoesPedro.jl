module SimulacoesPedro
    # Data
    include("Data.jl")
    export Data

    # Initial point and velocity
    include("initial_point.jl")
    include("initial_velocity.jl")
    export initial_point, initial_velocity

    # Naive potential
    include("rpbc.jl")
    include("upair.jl")
    include("utotal.jl")
    include("linear_index.jl")
    include("utotal_parallel.jl")
    export utotal
    export utotal_parallel1
    export utotal_parallel2
    export utotal_serial2

    # Linked List potential
    include("makell.jl")
    include("wrap_cell.jl")
    include("r2pbc.jl")
    include("upair2.jl")
    include("upair3.jl")
    include("utotal2.jl")
    include("utotal2_generic.jl")
    include("utotal2_parallel.jl")
    include("utotal3.jl")
    include("runsim.jl")
    export utotal2, utotal2_parallel, utotal3!, runsim, runsim!

end
