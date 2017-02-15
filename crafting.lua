--CaveRealms crafting.lua

--CRAFT RECIPES--

--reverse craft for glow mese
minetest.register_craft({
	output = "default:mese_crystal_fragment 8",
	type = "shapeless",
	recipe = {"caverealms:glow_mese"}
})

--thin ice to water
minetest.register_craft({
	output = "default:water_source",
	type = "shapeless",
	recipe = {"caverealms:thin_ice"}
})

--use for coal dust
minetest.register_craft({
	output = "default:coalblock",
	recipe = {
		{"caverealms:coal_dust","caverealms:coal_dust","caverealms:coal_dust"},
		{"caverealms:coal_dust","caverealms:coal_dust","caverealms:coal_dust"},
		{"caverealms:coal_dust","caverealms:coal_dust","caverealms:coal_dust"}
	}
})