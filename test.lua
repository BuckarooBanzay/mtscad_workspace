
return function(ctx)
    local s = "default:stone"
    local g = "default:glass"
    local a = "air"
    local x = ctx:slope(1, 1, 0):with("moreblocks:slope_stone")

    ctx
    :rotate(0, 90, 0)
    :pattern({
        {s,s,s,s,s},
        {s,g,g,g,s},
        {s,g,g,g,s},
        {s,g,g,g,s},
        {s,s,s,s,s}
    })
    :translate(0,0,1)
    :pattern({
        {s,s,s,s,s},
        {s,a,a,a,s},
        {s,a,a,a,s},
        {s,x,a,a,s},
        {s,s,s,s,s}
    })
end