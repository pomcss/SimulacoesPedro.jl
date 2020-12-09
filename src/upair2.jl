#
# Potential energy function using r2
#

function upair2(r2,data)
  r6 = r2^3
  r12 = r6^2
  return data.ε4*(data.σ12/r12 - data.σ6/r6)
end
