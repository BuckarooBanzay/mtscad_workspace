
local function pattern(ctx)
    ctx
    :with("wool:red")
    :line(5,0,0)

    ctx
    :with("wool:green")
    :translate(0,0,1)
    :line(5,0,0)

    ctx
    :with("wool:blue")
    :translate(0,0,2)
    :line(5,0,0)

    ctx
    :with("default:mese")
    :translate(5,0,0)
    :line(0,0,2)
end

return function(ctx)
    ctx
    :rotate(0,0,90)
    :translate(5,0,0)
    :rotate(90,90,0)
    :execute(pattern)
end