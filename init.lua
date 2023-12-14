local function print_to_everything(msg)
    msg = msg or "nil message"
    print("Debug - Message: " .. msg)  -- Ajoutez cette ligne pour le débogage
    minetest.log("action", "[chest_recovery] " .. msg)
    minetest.chat_send_all(msg)
end

local function print_to_everything(msg)
    msg = msg or "nil message"
    print("Debug - Message: " .. msg)  -- Ajoutez cette ligne pour le débogage
    minetest.log("action", "[chest_recovery] " .. msg)
    minetest.chat_send_all(msg)
end

minetest.register_node("chest_recovery:chest", {
    description = "cofre recovery" .. "\n" ..
        "32 inventory slots",
    tiles = {"chest_chest.png^[sheet:2x2:0,0", "chest_chest.png^[sheet:2x2:0,0",
        "chest_chest.png^[sheet:2x2:1,0", "chest_chest.png^[sheet:2x2:1,0",
        "chest_chest.png^[sheet:2x2:1,0", "chest_chest.png^[sheet:2x2:0,1"},
    paramtype2 = "facedir",
    groups = {dig_immediate = 2, choppy = 3, meta_is_privatizable = 1},
    is_ground_content = false,
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
            "size[8,9]"..
            "list[current_name;main;0,0;8,4;]"..
            "list[current_player;main;0,5;8,4;]" ..
            "listring[]")
        meta:set_string("infotext", "Chest")
        local inv = meta:get_inventory()
        inv:set_size("main", 8 * 4)
    end,
    can_dig = function(pos, player)
        local meta = minetest.get_meta(pos);
        local inv = meta:get_inventory()
        return inv:is_empty("main")
    end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        print_to_everything("Chest: " .. player:get_player_name() .. " triggered 'allow put' event for " .. stack:to_string())
        return stack:get_count()
    end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()
        if inv:is_empty("main") then
            -- Le coffre est maintenant vide, supprimez-le
            minetest.remove_node(pos)
        end
        print_to_everything("Chest: " .. player:get_player_name() .. " triggered 'allow take' event for " .. stack:to_string())
        return stack:get_count()
    end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
        print_to_everything("Chest: " .. player:get_player_name() .. " put " .. stack:to_string())
    end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()
        if inv:is_empty("main") then
            -- Le coffre est maintenant vide, supprimez-le
            minetest.remove_node(pos)
        end
        print_to_everything("Chest: " .. player:get_player_name() .. " took " .. stack:to_string())
    end,
})




-- Ajout de la gestion de la suppression si le coffre est vide lors de la mort du joueur
minetest.register_on_dieplayer(function(player)
    local player_inv = player:get_inventory()
    local pos = player:get_pos()
    pos.y = pos.y -- 0.5

    minetest.set_node(pos, {name = "chest_recovery:chest"})

    local chest_meta = minetest.get_meta(pos)
    local chest_inv = chest_meta:get_inventory()

    local is_empty = true

    for i = 1, player_inv:get_size("main") do
        local stack = player_inv:get_stack("main", i)
        chest_inv:set_stack("main", i, stack)
        player_inv:set_stack("main", i, ItemStack(nil))
        if not stack:is_empty() then
            is_empty = false
        end
    end

    for i = 1, player_inv:get_size("craft") do
        local stack = player_inv:get_stack("craft", i)
        chest_inv:set_stack("craft", i, stack)
        player_inv:set_stack("craft", i, ItemStack(nil))
        if not stack:is_empty() then
            is_empty = false
        end
    end

    if is_empty then
        minetest.remove_node(pos)
    else
        local chest_formspec = "size[8,9]" ..
                               "list[current_name;main;0,0;8,4;]" ..
                               "list[current_player;main;0,5;8,4;]" ..
                               "listring[]"
        chest_meta:set_string("formspec", chest_formspec)
    end
end)
