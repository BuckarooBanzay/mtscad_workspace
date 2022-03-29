
local function half_link(ctx, opts)
    ctx
    :with(opts.fullnode)
    :translate(0, 0, 2)
    :cube(1, 1, 1)
    :translate(2, 0, 2)
    :cube(2, 1, 1)
    :translate(0, 0, -4)
    :cube(2, 1, 1)

    ctx
    :with(opts.slopenode)
    :slope(-1, 0, -1)
    :translate(0, 0, 1)
    :set_node()
    :translate(1, 0, -1)
    :set_node()
    :slope(-1, 0, 1)
    :translate(0, 0, 4)
    :set_node()
    :translate(-1, 0, -1)
    :set_node()
    :slope(1, 0, -1)
    :translate(1, 0, 0)
    :set_node()
    :translate(0, 0, -2)
    :slope(1, 0, 1)
    :set_node()
end

return function(ctx, opts)
    ctx
    :execute(half_link, opts)
    :translate(7, 0, 4)
    :rotate(0, 180, 0)
    :execute(half_link, opts)
end, {
    defaults = {
        fullnode = "default:steelblock",
        slopenode = "moreblocks:slope_steelblock"
    }
}