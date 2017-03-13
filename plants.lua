-- Cavrealms plants and trees for lichen, moss and algae biomes

-- Lichen biome

--glowing fungi
minetest.register_node("caverealms:fungus", {
	description = "Glowing Fungus",
	tiles = {"caverealms_fungi.png"},
	inventory_image = "caverealms_fungi.png",
	wield_image = "caverealms_fungi.png",
	is_ground_content = true,
	groups = {oddly_breakable_by_hand=3},
	light_source = 5,
	paramtype = "light",
	drawtype = "plantlike",
	walkable = false,
	buildable_to = true,
	visual_scale = 1.0,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

--mycena mushroom
minetest.register_node("caverealms:mycena", {
	description = "Mycena Mushroom",
	tiles = {"caverealms_mycena.png"},
	inventory_image = "caverealms_mycena.png",
	wield_image = "caverealms_mycena.png",
	is_ground_content = true,
	groups = {oddly_breakable_by_hand=3},
	light_source = 6,
	paramtype = "light",
	drawtype = "plantlike",
	walkable = false,
	buildable_to = true,
	visual_scale = 1.0,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

--giant mushroom
if minetest.get_modpath("ethereal") then
	minetest.register_alias("caverealms:mushroom_cap", "ethereal:mushroom")
	minetest.register_alias("caverealms:mushroom_stem", "ethereal:mushroom_trunk")
else
	--stem
	minetest.register_node("caverealms:mushroom_stem", {
		description = "Giant Mushroom Stem",
		tiles = {"caverealms_mushroom_stem.png"},
		is_ground_content = true,
		groups = {choppy=2, oddly_breakable_by_hand=1},
	})

	--cap
	minetest.register_node("caverealms:mushroom_cap", {
		description = "Giant Mushroom Cap",
		tiles = {"caverealms_mushroom_cap.png"},
		is_ground_content = true,
		groups = {choppy=2, oddly_breakable_by_hand=1,},
		drop = {
			max_items = 1,
			items = {
				{items = {"caverealms:mushroom_sapling"}, rarity = 20},
				{items = {"caverealms:mushroom_cap"}}
			}
		},
	})

	--sapling
	minetest.register_node("caverealms:mushroom_sapling", {
		description = "Mushroom Tree Sapling",
		drawtype = "plantlike",
		tiles = {"caverealms_mushroom_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {
			snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1
		},
		sounds = default.node_sound_leaves_defaults(),
	})
end

--gills
minetest.register_node("caverealms:mushroom_gills", {
	description = "Giant Mushroom Gills",
	tiles = {"caverealms_mushroom_gills.png"},
	is_ground_content = true,
	light_source = 10,
	groups = {choppy=2, oddly_breakable_by_hand=1},
	drawtype = "plantlike",
	paramtype = "light",
})

