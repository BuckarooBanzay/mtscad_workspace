
return function(ctx)
    local s = "default:stone"
    local g = "default:glass"
    local x = ctx:slope(1, 1, 0):with("moreblocks:slope_stone")

    ctx:pattern({
        {s,s,s,s,s},
        {s,g,g,g,s},
        {s,g,g,g,s},
        {s,x,g,g,s},
        {s,s,s,s,s}
    })
end