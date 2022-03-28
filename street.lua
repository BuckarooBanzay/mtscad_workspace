

return function(ctx, opts)
    opts.width = opts.width or 16
    opts.length = opts.length or 10
    opts.borderwidth = opts.borderwidth or 3

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