
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
    :translate(1, 0, 4)
    :rotate(0, 180, 0)
    :execute(half_link, opts)

    ctx
    :translate(0, -2, 2)
    :rotate(90, 0, 0)
    :execute(half_link, opts)
end

return function(ctx, opts)
    ctx
    :execute(full_chain, opts)
    :translate(7, 0, 0)
    :rotate(90, 0, 0)
    :execute(full_chain, opts)
end, {
    defaults = {
        fullnode = "default:steelblock",
        slopenode = "moreblocks:slope_steelblock"
    }
}