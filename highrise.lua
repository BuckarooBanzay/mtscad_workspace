mtscad.require_mod("scifi_nodes")

local function rect(ctx, opts)
    local l = opts.length
    ctx:polygon({
        {0,0},
        {l,0},
        {l,l},
        {0,l},
        {0,0}
    })
end

local function floor(ctx, opts)
    ctx
    :with("scifi_nodes:blacktile2")
    :execute(rect, { length = 20 })

    for i=1,opts.height-1 do
        ctx
        :with("scifi_nodes:blackplate")
        :translate(1, i, 1)
        :execute(rect, { length = 18 })
    end

    ctx
    :with("scifi_nodes:blacktile2")
    :translate(0, opts.height, 0)
    :execute(rect, { length = 20 })
end

return function(ctx)
    local floors = 5
    local floorheight = 5

    -- base layer
    ctx
    :with("scifi_nodes:octofloor")
    :cube(20+7, 1, 20+7)

    -- floors
    for i=0,floors do
        ctx
        :translate(3, 1+(i*(floorheight+1)), 3)
        :execute(floor, { height = floorheight })
    end

    -- struts
    ctx
    :with("scifi_nodes:grey_square")
    :translate(0, 1, 0)
    :cube(3, (floors+1)*(floorheight+1), 3)
    ctx
    :with("scifi_nodes:grey_square")
    :translate(24, 1, 0)
    :cube(3, (floors+1)*(floorheight+1), 3)
    ctx
    :with("scifi_nodes:grey_square")
    :translate(0, 1, 24)
    :cube(3, (floors+1)*(floorheight+1), 3)
    ctx
    :with("scifi_nodes:grey_square")
    :translate(24, 1, 24)
    :cube(3, (floors+1)*(floorheight+1), 3)
end