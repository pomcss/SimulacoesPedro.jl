function linear_index(ind)
    j = round(Int, floor(-0.5 + 0.5*sqrt(1 + 8*(ind - 1))) + 2)
    i = round(Int, j .* (3 - j)/2 + ind -1)
    return i, j
end

