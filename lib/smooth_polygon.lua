
local function get_diagonal(p1, p2)
    local d = {
        x = p2[1] - p1[1],
        y = p2[2] - p1[2],
        z = p2[3] - p1[3]
    }

    local len = vector.length(d)
    local dir = vector.round(vector.divide(d, len))

    if dir.x == 0 then
        if dir.z == dir.y then
            return dir.x, dir.y, dir.z * -1
        end
    end
    print(dump({
        dir = dir,
        p1 = p1,
        p2 = p2,
        d = d
    }))
end


return function(ctx, opts)
    opts = mtscad.merge({}, opts)

    ctx:polygon(opts.path)

    for i, pos in ipairs(opts.path) do
        if i > 1 then
            local last_pos = opts.path[i-1]
            local x,y,z = get_diagonal(last_pos, pos)
            if x then
                ctx
                :slope(x,y,z)
                :with("moreblocks:slope_stone")
                :translate(last_pos[1], last_pos[2], last_pos[3])
                :line(pos[1]-last_pos[1], pos[2]-last_pos[2], pos[3]-last_pos[3])
            end
        end
    end
end