#
# Get right index considering Periodic Boundary Condition
#

function wrap_cell(nc ,ic)
    if ic < 1
        iw = nc[1]
    elseif ic > nc[1]
        iw = 1
    else
        iw = ic
    end
    return iw
end