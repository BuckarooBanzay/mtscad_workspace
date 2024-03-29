--[[
-- usage:
local stairs = mtscad.load_module("stairs")

return function(ctx)
    ctx
    :rotate(0, 0, 0)
    :execute(stairs, {
        height = 4,
        width = 5,
        slopes = "moreblocks:slope_stone",
        stairs = "moreblocks:stair_stone_alt_4",
        filler = "default:stone"
    })
end
--]]
mtscad.require_mod("default")
mtscad.require_mod("moreblocks")

return function(ctx, opts)
    opts = mtscad.merge({
        height = 4,
        width = 5,
        slopes = "moreblocks:slope_stone",
        stairs = "moreblocks:stair_stone_alt_4",
        filler = "default:stone"
    }, opts)

    -- filler
    ctx
    :with(opts.filler)
    :line(opts.height-1, opts.height-1, 0)
    :translate(0, 0, opts.width-1)
    :line(opts.height-1, opts.height-1, 0)

    -- slopes above
    ctx
    :with(opts.slopes)
    :param2(1)
    :translate(0, 1, 0)
    :line(opts.height-2, opts.height-2, 0)
    :translate(0, 0, opts.width-1)
    :line(opts.height-2, opts.height-2, 0)

    -- slopes below
    ctx
    :with(opts.slopes)
    :param2(21)
    :translate(1, 0, 0)
    :line(opts.height-2, opts.height-2, 0)
    :translate(0, 0, opts.width-1)
    :line(opts.height-2, opts.height-2, 0)

    -- stairs
    for z=1,opts.width-2 do
        ctx
        :with(opts.stairs)
        :param2(1)
        :translate(0, 0, z)
        :line(opts.height-1, opts.height-1, 0)
    end
end