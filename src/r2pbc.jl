#
# Squared distance function, considering Periodic Boundary Condition
#

function r2pbc(p1, p2, bdim)
    r2 = 0.
    for i = 1:2
        Δx = abs(p1[i] - p2[i]) % bdim
        if Δx > bdim/2
            Δx -= bdim
        end
        r2 += Δx^2
    end
    return r2
end
