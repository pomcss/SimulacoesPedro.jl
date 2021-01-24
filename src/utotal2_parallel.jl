#
# Computes the total potential energy of the system using r2
#

function utotal2_parallel(p,data)
    first_atom = zeros(Int64, data.nc, data.nc)
    next_atom = zeros(Int64, data.N)
    makell!(first_atom, next_atom, p, data)
    ut = 0.
    for ip = 1:data.N
        icell = trunc(Int64, p[ip][1]/data.cutoff) + 1
        jcell = trunc(Int64, p[ip][2]/data.cutoff) + 1
        for ic = icell-1:icell+1
            iw = wrap_cell(data.nc, ic)
            for jc = jcell-1:jcell+1
                jw = wrap_cell(data.nc, jc)
                jp = first_atom[iw,jw]
                while jp > 0
                    if ip < jp
                        r2 = r2pbc(p[ip], p[jp], data.bdim)
                        if r2 ≤ data.cutoff2
                            ut += upair2(r2, data)
                        end
                    end
                    jp = next_atom[jp]
                end
            end
        end
    end
    return ut
end
