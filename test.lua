local street = load("street")

return function(ctx)
    ctx
    :rotate(0, 0, 0)
    :execute(street, {
        width = 16,
        border = "moreblocks:iron_stone_bricks",
        pavement = "moreblocks:iron_stone"
    })
end