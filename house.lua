
local function facade(ctx)
    ctx
    :cube(1,4,6)
end

return function(ctx, opts)
    ctx
    :with(opts.facade)
    :execute(facade)
end