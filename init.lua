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
        "size[9,11]"..
        "list[current_name;main;0,0;9,4;]"..
        "list[current_name;armor;0,4;5,1;]"..
        "list[current_name;offhand;6,4;10,1;]" ..
        "label[0,5.5;-------------------------------------------]"..
        "list[current_player;offhand;6,6;9,1;]" ..
        "list[current_player;armor;0,6;9,1;]"..
        "list[current_player;main;0,7;9,4;]"..
        "listring[]"..
        "button[5,5;3,1;transfer;Transférer tout]")
        meta:set_string("infotext", "Coffre")
        local inv = meta:get_inventory()
        inv:set_size("main", 9 * 4)
        inv:set_size("armor", 9)
        inv:set_size("offhand", 1) -- Ajout de la section "offhand"
    end,
    on_destruct = function(pos)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()
        local drop_items = {}

        for _, listname in ipairs({"main", "armor", "offhand", "craft"}) do
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
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        -- Détection du clic Shift
        if player:get_player_control().sneak then
            local meta = minetest.get_meta(pos)
            local inv = meta:get_inventory()

            -- Déplacement d'objets du coffre au joueur
            if listname == "main" then
                local leftover = player:get_inventory():add_item("main", stack)
                inv:set_stack("main", index, leftover)
            elseif listname == "armor" then
                local leftover = player:get_inventory():add_item("armor", stack)
                inv:set_stack("armor", index, leftover)
            elseif listname == "offhand" then
                local leftover = player:get_inventory():add_item("offhand", stack)
                inv:set_stack("offhand", index, leftover)
            end
        end
    end,
    on_receive_fields = function(pos, formname, fields, sender)
        if fields.transfer then
            -- Transférer tout le contenu du coffre vers l'inventaire du joueur
            local meta = minetest.get_meta(pos)
            local inv = meta:get_inventory()
            local player_inv = sender:get_inventory()

            -- Transférer l'armure
            player_inv:set_stack("armor", 1, ItemStack("chest_recovery:inutile"))
            for i = 1, inv:get_size("armor") do
                local stack = inv:get_stack("armor", i)
                if i > 1 or not stack:is_empty() then
                    local player_armor_stack = player_inv:get_stack("armor", i)
                    local leftover = player_inv:add_item("armor", stack)

                    if not leftover:is_empty() then
                        -- L'ajout n'a pas réussi, rétablissons l'emplacement d'armure dans le coffre
                        inv:set_stack("armor", i, stack)
                    else
                        -- L'ajout a réussi, vidons l'emplacement d'armure dans le coffre
                        inv:set_stack("armor", i, ItemStack(nil))
                    end
                end
            end


            -- Transférer l'offhand
            local offhand_stack = inv:get_stack("offhand", 1)
            local leftover_offhand = player_inv:add_item("offhand", offhand_stack)
            inv:set_stack("offhand", 1, leftover_offhand)

            -- Transférer le reste de l'inventaire principal
            for i = 1, inv:get_size("main") do
                local stack = inv:get_stack("main", i)
                local leftover = player_inv:add_item("main", stack)
                inv:set_stack("main", i, leftover)
            end
        end
    end,
})



minetest.register_on_dieplayer(function(player)
    local player_inv = player:get_inventory()
    local pos = player:get_pos()
    pos.y = pos.y

    minetest.set_node(pos, {name = "chest_recovery:chest"})

    local chest_meta = minetest.get_meta(pos)
    local chest_inv = chest_meta:get_inventory()

    local is_empty = true

    for _, listname in ipairs({"main", "armor", "offhand", "craft"}) do
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
        local chest_formspec = "size[9,11]"..
        "list[current_name;main;0,0;9,4;]"..
        "list[current_name;armor;0,4;5,1;]"..
        "list[current_name;offhand;6,4;10,1;]" ..
        "label[0,5.5;-------------------------------------------]"..
        "list[current_player;offhand;6,6;9,1;]" ..
        "list[current_player;armor;0,6;9,1;]"..
        "list[current_player;main;0,7;9,4;]"..
        "listring[]"..
        "button[5,5;3,1;transfer;Transférer tout]"
        chest_meta:set_string("formspec", chest_formspec)
    end
end)

minetest.register_craftitem("votre_mod:inutile", {
    description = "Item Inutile",
    inventory_image = "votre_mod_inutile.png", -- Remplacez cela par le chemin de votre texture
    groups = {not_in_creative_inventory = 1}, -- Cela empêchera l'item de figurer dans l'inventaire créatif
    on_use = function(itemstack, user, pointed_thing)
        -- Supprimer l'item du joueur après utilisation
        itemstack:clear()  -- Cette ligne supprime l'item du stack
        return itemstack
    end,
})

