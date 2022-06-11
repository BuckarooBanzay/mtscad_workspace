mtscad.require_mod("default")

local slopes = "moreblocks:slope_stone"
local filler = "default:stone"

local function test(ctx)
    ctx
    :with(filler)
    :line(0, 5, 5)

    ctx
    :with(slopes)
    :translate(0, 1, 0)
    :line(0, 4, 4)

    ctx
    :with(slopes)
    :slope(0, -1, 1)
    :translate(0, 0, 1)
    :line(0, 4, 4)
end

return function(ctx)
    ctx
    :rotate(270, 0, 0)
    :execute(test)
end