
-- the lower left quarter of the window/pane
local function quarter(ctx, opts)
    ctx
    :with(opts.node)
    :translate(opts.border, 0, 0)
    :line((opts.width/2)-opts.border, 0, 0)

    ctx
    :with(opts.node)
    :translate(0, opts.border, 0, 0)
    :line(0, (opts.height/2)-opts.border, 0)

    ctx
    :with(opts.node)
    :translate(0, opts.border, 0)
    :line(opts.border, -opts.border, 0)

    -- outer slopes
    ctx
    :with(opts.slope)
    :slope(-1, -1, 0)
    :translate(0, opts.border-1, 0)
    :line(opts.border-1, -opts.border+1, 0)

    -- inner slopes
    ctx
    :with(opts.slope)
    :slope(1, 1, 0)
    :translate(1, opts.border, 0)
    :line(opts.border-1, -opts.border+1, 0)
end

return function(ctx, opts)
    opts = mtscad.merge({
        height = 16,
        width = 16,
        border = 5,
        node = "default:stone",
        slope = "moreblocks:slope_stone"
    }, opts)

    assert(opts.width % 2 == 0, "width should be an even number")
    assert(opts.height % 2 == 0, "height should be an even number")

    -- rotate and apply for each quarter
    ctx
    :execute(quarter, opts)

    ctx
    :translate(opts.width-1, 0, 0)
    :rotate(0, 0, 90)
    :execute(quarter, opts)

    ctx
    :translate(0, opts.height-1, 0)
    :rotate(0, 0, 270)
    :execute(quarter, opts)

    ctx
    :translate(opts.width-1, opts.height-1, 0)
    :rotate(0, 0, 180)
    :execute(quarter, opts)

end