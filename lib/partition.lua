
-- creates 2D partitions
return function(opts)
    local size_x = opts.size_x or 30
    local size_y = opts.size_y or 30
    local min_size = opts.min_size or 5

    local parts = {
        {pos={0,0}, size={size_x, size_y}}
    }

    for _=1,math.random(10)+5 do
        local part = parts[math.random(#parts)]

        if part.size[1] > (min_size*3) and part.size[2] > (min_size*3) then
            -- slice
            local axis = math.random(2)
            local third_size = math.floor(part.size[axis] / 3)
            local size1 = third_size + math.random(third_size)
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
