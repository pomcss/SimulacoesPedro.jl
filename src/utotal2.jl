#
# Computes the total potential energy of the system using r2
#

function utotal2(p,data)
  utotal = 0.
  for ip in 1:data.N-1
    for jp in ip+1:data.N
      rij2 = r2pbc(p[ip], p[jp], data.bdim)
      if rij2 < data.cutoff2
        utotal += upair2(rij2,data)
      end
    end
  end
  return utotal
end
