local missing_mods = {}

if not minetest.get_modpath("moreores") then table.insert(missing_mods, "moreores") end
if not minetest.get_modpath("alien_tools") then table.insert(missing_mods, "alien_tools") end
if not minetest.get_modpath("alien_material") then table.insert(missing_mods, "alien_material") end
if not minetest.get_modpath("tools_obsidian") then table.insert(missing_mods, "tools_obsidian") end
if not minetest.get_modpath("wielded_light") then table.insert(missing_mods, "wielded_light") end

if #missing_mods > 0 then
    error("\n\n[Master Flame] CRITICAL ERROR: Missing required mods: " .. table.concat(missing_mods, ", ") .. "\n")
end

minetest.register_tool("master_flame:master_flame", {
    description = "Master Flame", 
    inventory_image = "master_flame.png", 
    wield_scale = {x=1.3, y=1.3, z=1.3},
    range = 5000, 
    tool_capabilities = {
        full_punch_interval = 0.0,
        max_drop_level = 3,
        groupcaps = {
            unbreakable = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
            fleshy      = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
            choppy      = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
            bendy       = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
            cracky      = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
            crumbly     = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
            snappy      = {times={[1]=0.0, [2]=0.0, [3]=0.0}, uses=0, maxlevel=3},
        },
        damage_groups = {fleshy=32500},
    },
    on_punch = function(itemstack, hitter, node, toolcapabilities, time_from_last_punch)
        return toolcapabilities
    end,
})

minetest.register_craftitem("master_flame:master_core", {
    description = "Master Core", 
    inventory_image = "master_core.png", 
})

wielded_light.register_item_light("master_flame:master_flame", 15)
wielded_light.register_item_light("master_flame:master_core", 15)

minetest.register_craft({
    output = "master_flame:master_core",
    recipe = {
        {"moreores:sword_mithril", "default:sword_diamond",      "default:sword_mese"},
        {"default:sword_steel",    "alien_tools:flame",          "default:sword_bronze"},
        {"tools_obsidian:longsword_obsidian", "alien_material:alien_sword", "moreores:sword_silver"} 
    }
})

minetest.register_craft({
    output = "master_flame:master_flame",
    recipe = {
        {"default:diamondblock", "moreores:mithril_block", "default:diamondblock"},
        {"alien_material:alien_block", "master_flame:master_core", "moreores:mithril_block"},
        {"default:diamondblock", "moreores:mithril_block", "default:diamondblock"}
    }
})

