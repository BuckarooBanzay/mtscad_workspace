local chain = mtscad.load_module("lib/chain")


return function(ctx)
    for i=0,5 do
        ctx
        :rotate(0, 90, 0)
        :translate(i*12, 0, 0)
        :execute(chain)
    end
end