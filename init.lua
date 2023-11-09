mobs:register_mob("pretty_cats:pretty_cat", {
	type = "animal",
	specific_attack = {"mobs_animal:rat"},
	damage = 1,
	attack_type = "dogfight",
	attack_animals = true, -- so it can attack rat
	attack_players = false,
	reach = 1,
	stepheight = 1.1,
	passive = false,
	hp_min = 5,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.0, -0.0, -0.0, 0.4, 0.4, 0.4},
	visual = "mesh",
	visual_size = {x = 0.5, y = 0.5},
	mesh = "cat_simple.b3d",
	textures = {
		{"cat_simple.png^cat_simple_ao.png"},
		{"cat_undead.png^cat_simple_ao.png"},
		{"cat_red.png^cat_simple_ao.png"},
		{"cat_black.png^cat_simple_ao.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_kitten"
	},
	walk_velocity = 0.6,
	walk_chance = 15,
	run_velocity = 2,
	runaway = true,
	jump = false,
	drops = {
		{name = "farming:string", chance = 1, min = 0, max = 1}
	},
	water_damage = 0.01,
	lava_damage = 5,
	fear_height = 3,
	animation = {
		speed_normal = 42,
		stand_start = 97,
		stand_end = 192,
		walk_start = 0,
		walk_end = 96,
		stoodup_start = 0,
		stoodup_end = 0,
	},
	follow = {
		"mobs_animal:rat", "group:food_fish_raw",
		"mobs_fish:tropical", "mobs_fish:clownfish", "xocean:fish_edible"
	},
	view_range = 8,

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 4, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 50, 50, 90, false, nil) then return end

		-- by right-clicking owner can switch between staying and walking
		if self.owner and self.owner == clicker:get_player_name() then

			if self.order ~= "stand" then
				self.order = "stand"
				self.state = "stand"
				self.object:set_velocity({x = 0, y = 0, z = 0})
				self:set_animation("stand")
			else
				self.order = ""
				self:set_animation("stoodup")
			end
		end
	end
})

mobs:register_egg("pretty_cats:pretty_cat", "Pretty cat", "cat_inventory.png", 0)

