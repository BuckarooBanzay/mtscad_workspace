local defaults = mtscad.load_module("defaults")

return function(ctx, opts)
    opts = mtscad.merge(defaults, {
        border = "default:stonebrick",
        pavement = {
            ["default:cobble"] = 1,
            ["default:stone"] = 2
        }
    }, opts)

    ctx
    :with(opts.pavement)
    :cube(opts.width, 1, opts.length)
end