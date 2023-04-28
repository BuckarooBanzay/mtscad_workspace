
return function(ctx, opts)
    opts = mtscad.merge({
        fill = false,
        size_x = 15,
        size_y = 15,
        inset_x = 5,
        inset_y = 5
    }, opts)

    ctx
    :polygon({
        {0, opts.inset_y},
        {0, opts.size_y - opts.inset_y},
        {opts.inset_x, opts.size_y},
        {opts.size_x-opts.inset_x, opts.size_y},
        {opts.size_x, opts.size_y-opts.inset_y},
        {opts.size_x, opts.inset_y},
        {opts.size_x-opts.inset_x, 0},
        {opts.inset_x, 0},
        {0, opts.inset_y}
    }, opts.fill)
end