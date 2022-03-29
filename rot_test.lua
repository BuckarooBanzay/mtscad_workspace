local function axes(ctx, opts)
    ctx
    :with("default:stone")
    :set_node()

    ctx
    :translate(1,0,0)
    :with("wool:red")
    :cube(opts.size,1,1)

    ctx
    :with("wool:green")
    :translate(0,1,0)
    :cube(1,opts.size,1)

    ctx
    :with("wool:blue")
    :translate(0,0,1)
    :cube(1,1,opts.size)
end

return function(ctx, opts)
    ctx
    :with("default:mese")
    :set_node()

    ctx
    :rotate(-90, 0, 0)
    :translate(0, 0, 2)
    :execute(axes, opts)

end, {
    defaults = {
        size = 3
    }
}