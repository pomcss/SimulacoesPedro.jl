#
# Potential energy function using r2
#

function upair3(p1, p2, data)
    dx = p1[1] - p2[1]
    dy = p1[2] - p2[2]
    r2 = dx^2 + dy^2
    r6 = r2^3
    r8 = r6*r2
    r12 = r6^2
    r14 = r12*r2
    u = data.ε4*(data.σ12/r12 - data.σ6/r6)
    f = -data.ε24*(2*data.σ12/r14 - data.σ6/r8) * [dx, dy]
    return u, f
end
