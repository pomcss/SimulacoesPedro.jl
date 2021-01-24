#
# Computes the total potential energy of the system using r2
#

function utotal3!(ft, p, data)
    first_atom = zeros(Int64, data.nc, data.nc)
    next_atom = zeros(Int64, data.N)
    makell!(first_atom, next_atom, p, data)
    ut = 0.
    for i = 1:length(ft)
        ft[i] .= 0
    end
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
                        r2 = (p[ip][1]-p[jp][1])^2 + (p[ip][2]-p[jp][2])^2 # r2pbc(p[ip], p[jp], data.bdim)
                        if r2 ≤ data.cutoff2
                            up, fp = upair3(r2, p[ip], p[jp], data)
                            ut += up
                            ft[ip] .+= fp
                            ft[jp] .-= fp
                        end
                    end
                    jp = next_atom[jp]
                end
            end
        end
    end
    return ut
end

function utotal3(p, data)
    ft = [ Array{Float64}(undef, 2) for i=1:length(p) ]
    return utotal3!(ft, p, data)
end