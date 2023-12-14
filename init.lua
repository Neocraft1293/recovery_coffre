minetest.register_node("chest_recovery:chest", {
    description = "Coffre de récupération" .. "\n" .. "32 emplacements",
    tiles = {"chest_chest.png^[sheet:2x2:0,0", "chest_chest.png^[sheet:2x2:0,0",
        "chest_chest.png^[sheet:2x2:1,0", "chest_chest.png^[sheet:2x2:1,0",
        "chest_chest.png^[sheet:2x2:1,0", "chest_chest.png^[sheet:2x2:0,1"},
    paramtype2 = "facedir",
    groups = {dig_immediate = 2, choppy = 3, meta_is_privatizable = 1},
    is_ground_content = false,
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
            "size[9,10]"..
            "list[current_name;main;0,0;9,4;]"..
            "list[current_name;armor;0,4;9,1;]"..
            "list[current_player;armor;0,5;9,1;]"..
            "list[current_player;main;0,6;9,4;]"..
            "listring[]")
        meta:set_string("infotext", "Coffre")
        local inv = meta:get_inventory()
        inv:set_size("main", 9 * 4)
        inv:set_size("armor", 9)
    end,
    on_destruct = function(pos)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()
        local drop_items = {}

        for _, listname in ipairs({"main", "armor", "craft"}) do
            for i = 1, inv:get_size(listname) do
                local stack = inv:get_stack(listname, i)
                if not stack:is_empty() then
                    table.insert(drop_items, stack:to_table())
                end
            end
        end

        -- Lâcher tous les objets au-dessus du nœud du coffre
        for _, item in ipairs(drop_items) do
            minetest.add_item(pos, ItemStack(item))
        end
    end,
    -- (le reste du code reste inchangé)
})

-- Reste du code...

minetest.register_on_dieplayer(function(player)
    local player_inv = player:get_inventory()
    local pos = player:get_pos()
    pos.y = pos.y

    minetest.set_node(pos, {name = "chest_recovery:chest"})

    local chest_meta = minetest.get_meta(pos)
    local chest_inv = chest_meta:get_inventory()

    local is_empty = true

    for _, listname in ipairs({"main", "armor", "craft"}) do
        for i = 1, player_inv:get_size(listname) do
            local stack = player_inv:get_stack(listname, i)
            chest_inv:set_stack(listname, i, stack)
            player_inv:set_stack(listname, i, ItemStack(nil))
            if not stack:is_empty() then
                is_empty = false
            end
        end
    end

    if is_empty then
        minetest.remove_node(pos)
    else
        local chest_formspec = "size[9,10]" ..
                               "list[current_name;main;0,0;9,4;]" ..
                               "list[current_name;armor;0,4;9,1;]" ..
                               "list[current_player;armor;0,5;9,1;]" ..
                               "list[current_player;main;0,6;9,4;]" ..
                               "listring[]"
        chest_meta:set_string("formspec", chest_formspec)
    end
end)
