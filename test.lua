local octagon = mtscad.load_module("lib/octagon")

return function(ctx)
    ctx
    :with("default:stone")
    :execute(octagon, {
        size_x = 25,
        size_y = 15
    })
end