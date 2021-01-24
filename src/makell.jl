#
# Make linked list structure for p and data
#

function makell!(first_atom, next_atom, p, data)
    for iat = 1:data.N
        for ix = 1:2
            # p[iat][ix] = p[iat][ix] > 0 ? p[iat][ix] % data.bdim : p[iat][ix] % data.bdim + data.bdim
            if p[iat][ix] > 0 
                p[iat][ix] = p[iat][ix] % data.bdim
            else
                if p[iat][ix] % data.bdim == 0
                    p[iat][ix] = p[iat][ix] % data.bdim
                else
                    p[iat][ix] = p[iat][ix] % data.bdim + data.bdim
                end
            end
        end
        icell = trunc(Int64, p[iat][1]/data.cutoff) + 1
        jcell = trunc(Int64, p[iat][2]/data.cutoff) + 1
        next_atom[iat] = first_atom[icell,jcell]
        first_atom[icell,jcell] = iat
    end
end