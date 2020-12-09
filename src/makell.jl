#
# Make linked list structure for p and data
#

function makell!(first_atom, next_atom, p, cutoff)
    np = length(p)
    for iat = 1:np
        icell = trunc(Int64, p[iat][1]/cutoff + 1)
        jcell = trunc(Int64, p[iat][2]/cutoff + 1)
        next_atom[iat] = first_atom[icell,jcell]
        first_atom[icell,jcell] = iat
    end
end