
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

    if opts.fill then
        -- fill window
        -- TODO
    else
        -- inner slopes
        ctx
        :with(opts.slope)
        :slope(1, 1, 0)
        :translate(1, opts.border, 0)
        :line(opts.border-1, -opts.border+1, 0)
    end
end

local function apply_rotate_quarters(ctx, opts)
    -- rotate and apply for each quarter
    opts = mtscad.merge({
        fn = function() end,
        height = 10,
        width = 10,
        opts = {}
    }, opts)

    assert(opts.width % 2 == 0, "width should be an even number")
    assert(opts.height % 2 == 0, "height should be an even number")

    ctx
    :execute(opts.fn, opts.opts)

    ctx
    :translate(opts.width-1, 0, 0)
    :rotate(0, 0, 90)
    :execute(opts.fn, opts.opts)

    ctx
    :translate(0, opts.height-1, 0)
    :rotate(0, 0, 270)
    :execute(opts.fn, opts.opts)

    ctx
    :translate(opts.width-1, opts.height-1, 0)
    :rotate(0, 0, 180)
    :execute(opts.fn, opts.opts)
end

return function(ctx, opts)
    opts = mtscad.merge({
        height = 16,
        width = 16,
        border = 5,
        node = "default:stone",
        fill = false,
        slope = "moreblocks:slope_stone"
    }, opts)

    ctx:execute(apply_rotate_quarters, {
        opts = opts,
        fn = quarter,
        width = opts.width,
        height = opts.height
    })
end