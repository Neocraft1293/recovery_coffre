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
            "background[-0.19,-0.25;9.45,11.75;mcl_formspec_itemslot.png]"..
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
        inv:set_size("offhand", 1)
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
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        -- Code à exécuter lorsque le joueur clique avec le bouton droit sur le coffre
        --minetest.chat_send_player(player:get_player_name(), "Coffre ouvert!")
    
        -- Supprimer toutes les boussoles de récupération de l'inventaire du joueur
        local player_inv = player:get_inventory()
    
        for i = 1, player_inv:get_size("main") do
            local stack = player_inv:get_stack("main", i)
            --minetest.chat_send_player(player:get_player_name(), "Nom de l'item : " .. stack:get_name())
    
            if stack:get_name():find("mcl_compass:.*_recovery") then
                -- Utilisez la méthode remove_item pour supprimer l'élément de l'inventaire
                player_inv:remove_item("main", stack)
                --minetest.chat_send_player(player:get_player_name(), "Coffre de récupération supprimé!")
            end
        end
    end,
    on_receive_fields = function(pos, formname, fields, sender)
        if fields.transfer then
            -- Transférer tout le contenu du coffre vers l'inventaire du joueur
            local meta = minetest.get_meta(pos)
            local inv = meta:get_inventory()
            local player_inv = sender:get_inventory()



            -- Supprimer toutes les boussoles de récupération de l'inventaire du joueur
for i = 1, player_inv:get_size("main") do
    local stack = player_inv:get_stack("main", i)
    --.chat_send_player(sender:get_player_name(), "Nom de l'item : " .. stack:get_name())

    if stack:get_name():find("mcl_compass:.*_recovery") then
        -- Utilisez la méthode remove_item pour supprimer l'élément de l'inventaire
        player_inv:remove_item("main", stack)
        -- minetest.chat_send_player(sender:get_player_name(), "Coffre de récupération supprimé!")
    end
end







            -- Transférer l'armure
for i = 1, inv:get_size("armor") do
    local stack = inv:get_stack("armor", i)
    if i > 1 or not stack:is_empty() then
        local player_armor_stack = player_inv:get_stack("armor", i)
        if player_armor_stack:is_empty() then
            player_inv:set_stack("armor", i, stack)
            inv:set_stack("armor", i, ItemStack(nil))
        end
    end
end
-- Mettre à jour l'armure du joueur
-- Mettre à jour l'armure du joueur
local player_name = sender:get_player_name()
local player = minetest.get_player_by_name(player_name)
mcl_armor.update(player)



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
            -- Vérifier si le coffre est vide, puis le supprimer
            if inv:is_empty("main") and inv:is_empty("armor") and inv:is_empty("offhand") then
            minetest.remove_node(pos)
        end
        end
    end,
})



minetest.register_on_dieplayer(function(player)
    local player_inv = player:get_inventory()
    local pos = player:get_pos()

    local air_found = false

    -- Limite maximale pour la recherche ascendante
    local max_search_height = 31000

    -- Vérifiez s'il y a de l'air au-dessus de la position du joueur
    while not air_found do
        local node_above = minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z})
        if node_above.name == "air" then
            air_found = true
        else
            -- Si ce n'est pas de l'air, ajustez la position vers le haut
            pos.y = pos.y + 1

            -- Vérifiez si la nouvelle position dépasse la limite de recherche
            if pos.y > max_search_height then
                -- Abandonnez la recherche si nous atteignons la limite
                return
            end
        end
    end

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
        "background[-0.19,-0.25;9.45,11.75;mcl_formspec_itemslot.png]"..
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




-- Define compass_frames as a global variable
compass_frames = 32

minetest.register_on_respawnplayer(function(player)
    -- Generate a new random frame for the recovery compass
    local random_frame = math.random(0, compass_frames - 1)

    -- Create the recovery compass item
    local recovery_compass = ItemStack("mcl_compass:" .. random_frame .. "_recovery")
    local player_inv = player:get_inventory()

    if player_inv then
        player_inv:add_item("main", recovery_compass)
    end

    local pos = player:get_pos()
    local chest_pos = minetest.find_node_near(pos, 5, "chest_recovery:chest")

    if chest_pos then
        local chest_meta = minetest.get_meta(chest_pos)
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
            minetest.remove_node(chest_pos)
        else
            local chest_formspec = "size[9,11]" ..
                "background[-0.19,-0.25;9.45,11.75;mcl_formspec_itemslot.png]" ..
                "list[current_name;main;0,0;9,4;]" ..
                "list[current_name;armor;0,4;5,1;]" ..
                "list[current_name;offhand;6,4;10,1;]" ..
                "label[0,5.5;-------------------------------------------]" ..
                "list[current_player;offhand;6,6;9,1;]" ..
                "list[current_player;armor;0,6;9,1;]" ..
                "list[current_player;main;0,7;9,4;]" ..
                "listring[]" ..
                "button[5,5;3,1;transfer;Transférer tout]"
            chest_meta:set_string("formspec", chest_formspec)
        end
    end
end)



