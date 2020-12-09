#
# Potential energy function using r2
#

function upair2(r2,data)
  r6 = r2^3
  r12 = r6^2
  return data.eps4*(data.sig12/r12 - data.sig6/r6)
end
