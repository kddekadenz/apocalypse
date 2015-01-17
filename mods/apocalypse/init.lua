speed = minetest.setting_get("time_speed")/96

minetest.register_abm(
        {nodenames = {"default:dirt_with_grass"},
        interval = 10/speed,
        chance = 50,
        action = function(pos)
		if pos.y > -10 then
		minetest.env:add_node(pos, {name="default:dirt"})
		end
        end,
})


minetest.register_abm(
        {nodenames = {"default:leaves"},
        interval = 10/speed,
        chance = 100,
        action = function(pos)
		if pos.y > -10 then
		minetest.env:remove_node(pos)
		end
        end,
})

minetest.register_abm(
        {nodenames = {"default:water_source"},
        interval = 10/speed,
        chance = 50,
        action = function(pos)
		if pos.y > -10 then
		minetest.env:remove_node(pos)
			if minetest.env:get_node({x=pos.x, y=pos.y -1, z=pos.z}).name == "default:water_source" then
			minetest.env:remove_node({x=pos.x, y=pos.y -1, z=pos.z})
			end
			if minetest.env:get_node({x=pos.x, y=pos.y +1, z=pos.z}).name == "default:water_source" then
			minetest.env:remove_node({x=pos.x, y=pos.y +1, z=pos.z})
			end

			if minetest.env:get_node({x=pos.x -1, y=pos.y, z=pos.z}).name == "default:water_source" then
			minetest.env:remove_node({x=pos.x -1, y=pos.y, z=pos.z})
			end
			if minetest.env:get_node({x=pos.x +1, y=pos.y, z=pos.z}).name == "default:water_source" then
			minetest.env:remove_node({x=pos.x +1, y=pos.y, z=pos.z})
			end

			if minetest.env:get_node({x=pos.x, y=pos.y, z=pos.z -1}).name == "default:water_source" then
			minetest.env:remove_node({x=pos.x, y=pos.y, z=pos.z -1})
			end
			if minetest.env:get_node({x=pos.x, y=pos.y, z=pos.z +1}).name == "default:water_source" then
			minetest.env:remove_node({x=pos.x, y=pos.y, z=pos.z +1})
			end
		end
        end,
})

minetest.register_abm(
        {nodenames = {"group:flammable"},
        interval = 30/speed,
        chance = 2000,
        action = function(pos)
		if pos.y > -10 then
		minetest.env:add_node(pos, {name="fire:basic_flame"})
		end
        end,
})
