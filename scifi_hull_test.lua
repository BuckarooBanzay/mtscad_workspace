local scifi_hull = mtscad.load_module("scifi_hull")

return function(ctx)

    ctx
    :rotate(90, 0, 0)
    :execute(scifi_hull, {
        size_x = 80,
        size_y = 30
    })
end