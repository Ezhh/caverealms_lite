--CaveRealms crafting.lua

--CRAFT RECIPES--

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

-- Requires ethereal:fish_raw
if minetest.get_modpath("ethereal") then

	-- Professional Fishing Rod
	minetest.register_craftitem("caverealms:angler_rod", {
		description = "Pro Fishing Rod",
		inventory_image = "caverealms_angler_rod.png",
		wield_image = "caverealms_angler_rod.png"
	})

	minetest.register_craft({
		output = "caverealms:angler_rod",
		recipe = {
				{"","","default:steel_ingot"},
				{"", "default:steel_ingot", "caverealms:mushroom_gills"},
				{"default:steel_ingot", "", "caverealms:mushroom_gills"},
			}
	})

	-- default ethereal fish
	local fish = {
		{"ethereal:fish_raw"},
	}

	-- Pro Fishing Rod (Baited)
	minetest.register_craftitem("caverealms:angler_rod_baited", {
		description = "Baited Pro Fishing Rod",
		inventory_image = "caverealms_angler_rod_baited.png",
		wield_image = "caverealms_angler_rod_weild.png",
		stack_max = 1,
		liquids_pointable = true,

		on_use = function (itemstack, user, pointed_thing)

			if pointed_thing.type ~= "node" then
				return
			end

			local node = minetest.get_node(pointed_thing.under).name

			if (node == "default:water_source"
			or node == "default:river_water_source")
			and math.random(1, 100) < 20 then

				local type = fish[math.random(1, #fish)][1]
				local inv = user:get_inventory()

				if inv:room_for_item("main", {name = type}) then

					inv:add_item("main", {name = type})

					return ItemStack("caverealms:angler_rod")
				else
					minetest.chat_send_player(user:get_player_name(),
						"Inventory full, Fish Got Away!")
				end
			end
		end,
	})

	minetest.register_craft({
		type = "shapeless",
		output = "caverealms:angler_rod_baited",
		recipe = {"caverealms:angler_rod", "caverealms:glow_worm_green"},
	})
end
