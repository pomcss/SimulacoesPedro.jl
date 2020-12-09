#
# Potential energy function
#

function upair(r,data)
  r6 = r^6
  r12 = r6^2
  return data.ε4*(data.σ12/r12 - data.σ6/r6)
end
