local partition = load("partition")

return function(ctx, opts)
    opts = opts or {}
    opts.size_x = opts.size_x or 50
    opts.size_y = opts.size_y or 50

    local partitions = partition({
        size_x = opts.size_x,
        size_y = opts.size_y,
        min_size = 3
    })

    -- visualize
    for _, p in ipairs(partitions) do
        if p.size[1] > 10 and p.size[2] > 10 then
            -- large feature
            ctx
            :with("scifi_nodes:blackplate")
            :translate(p.pos[1], 2, p.pos[2])
            :cube(p.size[1], 1, p.size[2])
            :with("air") -- clear inner rect
            :translate(1, 0, 1)
            :cube(p.size[1]-2, 1, p.size[2]-2)
            :with("scifi_nodes:blackplate")
            :translate(0, -1, 0) -- smaller cube on lower y
            :cube(p.size[1]-2, 1, p.size[2]-2)

        elseif p.size[1] < 7 or p.size[2] < 7 then
            -- small feature
            ctx
            :with("scifi_nodes:blackvent")
            :translate(p.pos[1], 2, p.pos[2])
            :cube(p.size[1], 1, p.size[2])
            :translate(1, 1, 1) --smaller cube on top
            :cube(p.size[1]-2, 1, p.size[2]-2)
        else
            -- default hull
            ctx
            :with({
                ["scifi_nodes:blackdmg"] = 10,
                ["scifi_nodes:blackdmgstripe"] = 2,
                ["scifi_nodes:blackvent"] = 2,
                ["scifi_nodes:blackplate"] = 5
            })
            :translate(p.pos[1], 2, p.pos[2])
            :cube(p.size[1], 1, p.size[2])
        end
    end
end