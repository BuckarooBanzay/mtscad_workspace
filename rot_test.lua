return function(ctx)
    ctx
    :translate(1,0,0)
    :with("wool:red")
    :cube(10,1,1)

    ctx
    :with("wool:blue")
    :rotate(0,90,0)
    :translate(1,0,0)
    :cube(10,1,1)

    ctx
    :with("wool:green")
    :rotate(0,180,0)
    :translate(1,0,0)
    :cube(10,1,1)

    ctx
    :with("wool:yellow")
    :rotate(0,270,0)
    :translate(1,0,0)
    :cube(10,1,1)
end