
local function window(ctx, opts)
    ctx
    :with(opts.border)
    :cube(2, 1, opts.size)
    :cube(2, opts.size, 1)
    :translate(0, opts.size-1, 0)
    :cube(2, 1, opts.size)
    :translate(0, -opts.size+1, opts.size-1)
    :cube(2, opts.size, 1)

    ctx
    :with(opts.glass)
    :translate(1, 1, 1)
    :cube(1, opts.size-2, opts.size-2)

    ctx
    :with(opts.slope)
    :translate(0,1,1)
    :slope(0, 1, 1)
    :set_node()
end

return function(ctx, opts)
    opts = mtscad.merge({
        border = "default:stone",
        glass = "default:glass",
        slope = "moreblocks:slope_stone",
        size = 5
    }, opts)

   ctx
   :translate(0, 0, 0)
   :rotate(0, 180, 0)
   :execute(window, opts)

end