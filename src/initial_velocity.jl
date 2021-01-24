#
# Sets inicial velocities for particles in p.
#

function initial_velocity(T, m, N)
    R = 8.314_462_618_153_24
    vmod = sqrt.( -2R*T * log.(-rand(N) .+ 1)./m )
    angle = 2*π*rand(N)
    return [ [vmod[i] * cos(angle[i]), vmod[i] * sin(angle[i])] for i=1:N ]
end
