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
    :with(opts.border)
    :cube(opts.borderwidth, 2, opts.length)
    :translate(opts.borderwidth, 0, 0)
    :with(opts.pavement)
    :cube(opts.width - (2*opts.borderwidth), 1, opts.length)
    :translate(opts.width - (2*opts.borderwidth), 0, 0)
    :with(opts.border)
    :cube(opts.borderwidth, 2, opts.length)
end