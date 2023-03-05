
local partition = mtscad.load_module("lib/partition")
mtscad.require_mod("default")
mtscad.require_mod("wool")

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
    opts = mtscad.merge({
        size_x = 30,
        size_y = 30,
        min_size = 4
    }, opts)

    -- partition
    local partitions = partition(opts)

    print("Got " .. #partitions .. " partitions")

    -- visualize
    for i, p in ipairs(partitions) do
        print(dump(p))
        ctx
        :with(nodes[i])
        :translate(p.pos[1], 0, p.pos[2])
        :cube(p.size[1], 1, p.size[2])
    end

end