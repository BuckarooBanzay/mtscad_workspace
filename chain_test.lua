local chain = load("chain")


return function(ctx)
    ctx
    :rotate(0, 0, 90)
    :execute(chain)
end