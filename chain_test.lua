local chain = load("chain")


return function(ctx)
    ctx
    :rotate(90, 0, 0)
    :rotate(0, 0, 90)
    :execute(chain)
end