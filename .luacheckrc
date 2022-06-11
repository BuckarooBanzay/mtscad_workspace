read_globals = {
	-- Stdlib
	string = {fields = {"split", "trim"}},
	table = {fields = {"copy", "getn"}},
	"vector",

	-- Minetest
	"dump", "print",

	-- mtscad
	mtscad = {
		fields = {
			"merge",
			"load_module",
			"require_mod"
		}
	}
}
