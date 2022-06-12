mtscad.require_mod("default")

local octa_pane = mtscad.load_module("octa_pane")

return function(ctx)
    ctx
    :execute(octa_pane, {})
end