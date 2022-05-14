local stairs = load("stairs")
local defaults = {
    height = 4,
    width = 5,
    slopes = "moreblocks:slope_stone",
    stairs = "moreblocks:stair_stone_alt_4",
    filler = "default:stone"
}

return function(ctx)
    ctx
    :translate(10,0,0)
    :rotate(90, 0, 0)
    :execute(stairs, defaults)
    :translate(3, 3, 0)
    :execute(stairs, defaults)

end