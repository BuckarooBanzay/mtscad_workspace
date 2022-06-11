
local function is_diagonal(p1, p2)
    return p1[1] == p2[2] or p1[2] == p2[3] or p1[3] == p2[1]
end


return function(ctx, opts)
    opts = mtscad.merge({}, opts)

    ctx:polygon(opts.path)

    for i, pos in ipairs(opts.path) do
        if i > 1 then
            local last_pos = opts.path[i-1]
            if is_diagonal(pos, last_pos) then
                print(dump({
                    pos = pos,
                    last_pos = last_pos
                }))
            end
        end
    end
end