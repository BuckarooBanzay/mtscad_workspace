mtscad.require_mod("default")

local smooth_polygon = mtscad.load_module("lib/smooth_polygon")

return function(ctx)
    ctx
    :with("default:stone")
    :execute(smooth_polygon, {
        path = {
            {0,0,0},
            {0,4,0},
            {0,8,4},
            {0,8,8}
        }
    })
end