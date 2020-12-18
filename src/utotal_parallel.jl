#
# Computes the total potential energy of the system
#

function utotal_parallel1(p,data)
    nthreads = Threads.nthreads()
    utotal = zeros(nthreads)
    Threads.@threads for ip in 1:data.N-1
        id = Threads.threadid()
        for jp in ip+1:data.N
            rij = rpbc(p[ip],p[jp],data.bdim)
            if rij < data.cutoff
                utotal[id] += upair(rij,data)
            end
        end
    end
    return sum(utotal)
end

function ij_pair(N)
    npairs = N*(N-1)÷2
    ij = Array{Int}(undef, npairs, 2)
    for ipair in 1:npairs
        ij[ipair,1], ij[ipair,2] = linear_index(ipair)
    end
    return ij
end
export ij_pair

function utotal_serial2(p,data,ij)
    @unpack N, bdim, cutoff = data
    npairs = N*(N-1)÷2
    utotal = 0.
    for ipair in 1:npairs
        ip = ij[ipair,1]
        jp = ij[ipair,2]
        rij = rpbc(p[ip],p[jp], bdim)
        if rij < cutoff
            utotal += upair(rij,data)
        end
    end
    return utotal
end

function utotal_parallel2(p,data,ij)
    nthreads = Threads.nthreads()
    @unpack N, bdim, cutoff = data
    npairs = N*(N-1)÷2
    utotal = zeros(nthreads)
    npthreads = npairs ÷ nthreads
    if mod(npairs, nthreads) != 0
        error(" mod(npairs, nthreads) != 0 ")
    end
    Threads.@threads for id = 1:nthreads
        ifirst = npthreads*(id - 1) + 1
        ilast = npthreads*id
        for ipair in ifirst:ilast
            ip = ij[ipair,1]
            jp = ij[ipair,2]
            rij = rpbc(p[ip],p[jp], bdim)
            if rij < cutoff
                utotal[id] += upair(rij,data)
            end
        end
    end
    return sum(utotal)
end