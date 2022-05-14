
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

local function full_chain(ctx, opts)
    ctx
    :translate(0, 0, -2)
    :rotate(0,0,0)
    :execute(half_link, opts)

    ctx
    :translate(7, 0, 2)
    :rotate(0,180,0)
    :execute(half_link, opts)
end

return function(ctx, opts)
    opts = merge_table({
        fullnode = "default:steelblock",
        slopenode = "moreblocks:slope_steelblock"
    }, opts)

    ctx
    :execute(full_chain, opts)

    ctx
    :translate(6, 0, 0)
    :rotate(90, 0 ,0)
    :execute(full_chain, opts)
end