#
# Potential energy function using r2
#

function upair3(p1, p2, data)
    dx = p1[1] - p2[1]
    dy = p1[2] - p2[2]
    r = sqrt(dx^2 + dy^2)
    r6 = r2^6
    r7 = r6*r
    r12 = r6^2
    r13 = r12*r
    u = data.ε4*(data.σ12/r12 - data.σ6/r6)
    f = data.ε48*(2*data.σ12/r13 - data.σ6/r7) * [dx, dy]
    return u, f
end
