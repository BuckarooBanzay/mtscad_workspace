local function partition(size_x, size_y)
    local parts = {
        {pos={0,0}, size={size_x, size_y}}
    }

    for _=1,math.random(10)+5 do
        local part = parts[math.random(#parts)]

        if part.size[1] > 10 and part.size[2] > 10 then
            -- slice
            local axis = math.random(2)
            local size1 = math.random(5) + 3
            local size2 = part.size[axis] - size1

            -- duplicate
            local new_part = {
                pos={part.pos[1], part.pos[2]},
                size={part.size[1], part.size[2]}
            }

            -- set new sizes
            part.size[axis] = size1
            new_part.size[axis] = size2

            -- offset new part
            new_part.pos[axis] = new_part.pos[axis] + part.size[axis]
            table.insert(parts, new_part)
        end
    end

    return parts
end

local nodes = {
    "default:glass",
    "default:stone",
    "default:cobble",
    "default:mese",
    "default:steelblock",
    "wool:red",
    "wool:green",
    "wool:yellow",
    "wool:black",
    "wool:white",
    "wool:blue",
    "wool:orange",
    "wool:violet"
}

return function(ctx, opts)
    -- partition
    local partitions = partition(opts.size_x, opts.size_y)
    print("Got " .. #partitions .. " partitions")

    -- visualize
    for i, p in ipairs(partitions) do
        print(dump(p))
        ctx
        :with(nodes[i])
        :translate(p.pos[1], 0, p.pos[2])
        :cube(p.size[1], 1, p.size[2])
    end

end, {
    defaults = {
        size_x = 30,
        size_y = 30
    }
}