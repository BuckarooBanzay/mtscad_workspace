
require_mod("scifi_nodes")
require_mod("moreblocks")

local function slice(ctx, opts)
    local fn = opts.full_node
    local s1 = { name=opts.slope_node, param2=21 } -- x+, y-
    local s2 = { name=opts.slope_raised_node, param2=21 }
    local pn = opts.pane_node

    ctx
    :pattern({
        {fn, fn, fn},
        {fn, s2, s1},
        {fn, pn, pn}
    })
end

local function window(ctx, opts)
    -- upper left part (looking to z+/north)
    ctx
    :translate(0, 3, 0)
    :execute(slice, opts)

    -- lower left part
    ctx
    :translate(0, 2, 0)
    :rotate(180, 0, 0)
    :execute(slice, opts)

    -- upper right part
    ctx
    :translate(5, 3, 0)
    :rotate(0, 180, 0)
    :execute(slice, opts)

    -- lower right part
    ctx
    :translate(5, 2, 0)
    :rotate(180, 180, 0)
    :execute(slice, opts)
end

return function(ctx, opts)
    opts = merge_table({
        full_node = "scifi_nodes:blackdmg",
        slope_node = "scifi_nodes:slope_blackdmg_half",
        slope_raised_node = "scifi_nodes:slope_blackdmg_half_raised",
        pane_node = "scifi_nodes:octgrn_pane"
    }, opts)

    ctx
    :rotate(90, 90, 0)
    :execute(window, opts)
end