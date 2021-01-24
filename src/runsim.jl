#
# Run the simulation steps by position incrementation
#

using Plots
using Printf

function runsim(nsteps, dt, m, data)
    p = initial_point(data)
    f = [ Array{Float64}(undef, 2) for i = 1:data.N ]
    v = initial_velocity(data.T, m, data.N)
    e = runsim!(p, f, v, nsteps, dt, m, data)
    return p, f, v, e
end

function runsim!(p, f, v, nsteps, dt, m, data)
    iprint = 50_000
    np = trunc(Int64, nsteps/iprint) + 1
    e = Array{Float64}(undef, np, 2)
    @printf("        u        |        k        |       et        \n")
    @printf("-----------------+-----------------+-----------------\n")
    for i = 1:nsteps
        u = utotal3!(f, p, data)
        k = 0.
        if i%iprint == 0 || i == 1
            x=Array{Float64}(undef, data.N)
            y=Array{Float64}(undef, data.N)
        end
        for ip = 1:data.N
            k += m*(v[ip][1]^2 + v[ip][2]^2)/2
            @. p[ip] = p[ip] + v[ip]*dt + f[ip]*dt^2/(2*m)
            @. v[ip] = v[ip] + f[ip]*dt/m
            if i%iprint == 0 || i == 1
                x[ip] = p[ip][1]
                y[ip] = p[ip][2]
            end
        end
        if i%iprint == 0 || i == 1
            ipr = trunc(Int64, i/iprint) + 1
            e[ipr,:] = [u; k]
            @printf("  % e  |  % e  |  % e  \n", u, k, u+k)
            display(scatter(x,y,xlims=(0,100),ylims=(0,100), markersize=4, label=false))
        end
    end
    return e
end