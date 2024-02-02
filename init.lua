local S = minetest.get_translator("chest_recovery") -- Récupérer le traducteur pour ce mod

minetest.register_node("chest_recovery:chest", {
    drop = "",
    description = S("Recovery Chest") .. "\n" .. S("32 slots"),
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
-- Ligne 1
    mcl_formspec.get_itemslot_bg_v4(0, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(1, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(2, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(3, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(4, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(5, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(6, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(7, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(8, 0, 1, 1) ..
-- Ligne 2
    mcl_formspec.get_itemslot_bg_v4(0, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(1, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(2, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(3, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(4, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(5, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(6, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(7, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(8, 1, 1, 1) ..

-- Ligne 3
    mcl_formspec.get_itemslot_bg_v4(0, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(1, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(2, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(3, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(4, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(5, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(6, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(7, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(8, 2, 1, 1) ..

-- Ligne 4
    mcl_formspec.get_itemslot_bg_v4(0, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(1, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(2, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(3, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(4, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(5, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(6, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(7, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(8, 3, 1, 1) ..

-- Ligne 5
mcl_formspec.get_itemslot_bg_v4(1, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 4, 1, 1) ..

-- Ligne 6

-- Ligne 7
mcl_formspec.get_itemslot_bg_v4(1, 6, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 6, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 6, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 6, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 6, 1, 1) ..

-- Ligne 8

mcl_formspec.get_itemslot_bg_v4(0, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 7, 1, 1) ..

-- Ligne 9
mcl_formspec.get_itemslot_bg_v4(0, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 8, 1, 1) ..

-- Ligne 10
mcl_formspec.get_itemslot_bg_v4(0, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 9, 1, 1) ..

-- Ligne 11
mcl_formspec.get_itemslot_bg_v4(0, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 10, 1, 1) ..



            "list[current_name;armor;0,4;5,1;]"..
            "list[current_name;offhand;6,4;10,1;]" ..
            "label[0,5;-------------------------------------------]"..
            "list[current_player;offhand;6,6;9,1;]" ..
            "list[current_player;armor;0,6;9,1;]"..
            "list[current_player;main;0,7;9,4;]"..
            "listring[]"..
            "button[5,5;3,1;transfer;" .. S("Transfer All") .. "]")
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
-- Vérifier si le joueur existe
    -- Vérifier si le mod "mcl_armor" est chargé
    if minetest.get_modpath("mcl_armor") then
        -- Mettre à jour les informations du joueur avec le mod
        local player_name = sender:get_player_name()
        local player = minetest.get_player_by_name(player_name)
        mcl_armor.update(player)
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
            -- Vérifier si le coffre est vide, puis le supprimer
            if inv:is_empty("main") and inv:is_empty("armor") and inv:is_empty("offhand") then
            minetest.remove_node(pos)
        end
        end
    end,
})







































-- Fonction appelée lorsqu'un joueur meurt
minetest.register_on_dieplayer(function(player)
    -- Récupérer l'inventaire du joueur
    local player_inv = player:get_inventory()
    pos = player:get_pos()
    pos.y = pos.y -- Réglage de la coordonnée Y (elle semble inchangée)

    -- rendre les cordonner en entier
 

    -- Envoyer un message au joueur indiquant ses coordonnées après la mort
    minetest.chat_send_player(player:get_player_name(), "Vous êtes mort, aux coordonnées : " .. minetest.pos_to_string(pos))



    --si y estentre -27000 et -28000 alors on met la position a -27000
    if pos.y < -27000 and pos.y > -28000 then
        --si la position est plus haut que 27000 alors on met la position a 27000
        if pos.y < -27000 then
            pos.y = -27001
        end
                
    end

        
    --detecter si la postion du pos est dans un bloc vide
    local node = minetest.get_node(pos)
    --si le node name n'est pas air alors on marque le message
    if node.name ~= "air" then
        --recherche de la position dun bloc vide au dessus du de la position 
        --temp que le node name n'est pas air alors on ajoute 1 a la position Y
        while node.name ~= "air" do
            pos.y = pos.y + 1
            node = minetest.get_node(pos)
        end
        --on marque le message avec la nouvelle position
    end




    -- Placer un coffre de récupération à la position du joueur décédé
    minetest.set_node(pos, {name = "chest_recovery:chest"})
    minetest.chat_send_player(player:get_player_name(), "votre coffre de récupération est à la position : " .. minetest.pos_to_string(pos))


    -- Obtenir les métadonnées et l'inventaire du coffre de récupération
    local chest_meta = minetest.get_meta(pos)
    local chest_inv = chest_meta:get_inventory()

    local is_empty = true

    -- Transférer les objets de l'inventaire du joueur au coffre de récupération
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

    -- Si l'inventaire du joueur était vide, supprimer le coffre
    if is_empty then
        minetest.remove_node(pos)
    else
        -- Mettre à jour le formulaire du coffre avec les emplacements d'objets
        local chest_formspec = "size[9,12]"..
        -- marque le speudo du joueur comme ca : recovery chest de "pseudo" avec l'option de traduction
        "label[0,0; " .. S("Recovery Chest of") .. " " .. player:get_player_name() .. "]"..
        "list[current_name;main;0,1;9,4;]"..

-- Ligne 2
mcl_formspec.get_itemslot_bg_v4(0, 1, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 1, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 1, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 1, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 1, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 1, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 1, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 1, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 1, 1, 1) ..

-- Ligne 3
mcl_formspec.get_itemslot_bg_v4(0, 2, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 2, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 2, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 2, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 2, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 2, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 2, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 2, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 2, 1, 1) ..

-- Ligne 4
mcl_formspec.get_itemslot_bg_v4(0, 3, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 3, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 3, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 3, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 3, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 3, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 3, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 3, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 3, 1, 1) ..

--ligne 5
mcl_formspec.get_itemslot_bg_v4(0, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 4, 1, 1) ..
-- Ligne 6
mcl_formspec.get_itemslot_bg_v4(1, 5, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 5, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 5, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 5, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 5, 1, 1) ..





-- Ligne 8

mcl_formspec.get_itemslot_bg_v4(1, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 7, 1, 1) ..

-- Ligne 9
mcl_formspec.get_itemslot_bg_v4(0, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 8, 1, 1) ..

-- Ligne 10
mcl_formspec.get_itemslot_bg_v4(0, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 9, 1, 1) ..

-- Ligne 11
mcl_formspec.get_itemslot_bg_v4(0, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 10, 1, 1) ..

--ligne 12
mcl_formspec.get_itemslot_bg_v4(0, 11, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 11, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 11, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 11, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 11, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 11, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 11, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 11, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 11, 1, 1) ..




        "list[current_name;armor;0,5;5,1;]"..
        "list[current_name;offhand;6,5;10,1;]" ..
        -- marque le speudo du joueur comme ca : recovery chest de "pseudo" avec l'option de traduction
        "label[0,6; -------------------------------------------]"..
        "list[current_player;offhand;6,7;9,1;]" ..
        "list[current_player;armor;0,7;9,1;]"..
        "list[current_player;main;0,8;9,4;]"..
        "listring[]"..
        "button[5,6;3,1;transfer;" .. S("Transfer All") .. "]"
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
            local chest_formspec = "size[9,11]"..
            "list[current_name;main;0,0;9,4;]"..
-- Ligne 1
    mcl_formspec.get_itemslot_bg_v4(0, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(1, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(2, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(3, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(4, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(5, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(6, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(7, 0, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(8, 0, 1, 1) ..
-- Ligne 2
    mcl_formspec.get_itemslot_bg_v4(0, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(1, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(2, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(3, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(4, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(5, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(6, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(7, 1, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(8, 1, 1, 1) ..

-- Ligne 3
    mcl_formspec.get_itemslot_bg_v4(0, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(1, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(2, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(3, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(4, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(5, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(6, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(7, 2, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(8, 2, 1, 1) ..

-- Ligne 4
    mcl_formspec.get_itemslot_bg_v4(0, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(1, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(2, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(3, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(4, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(5, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(6, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(7, 3, 1, 1) ..
    mcl_formspec.get_itemslot_bg_v4(8, 3, 1, 1) ..

-- Ligne 5
mcl_formspec.get_itemslot_bg_v4(1, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 4, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 4, 1, 1) ..

-- Ligne 6

-- Ligne 7
mcl_formspec.get_itemslot_bg_v4(1, 6, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 6, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 6, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 6, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 6, 1, 1) ..

-- Ligne 8

mcl_formspec.get_itemslot_bg_v4(0, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 7, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 7, 1, 1) ..

-- Ligne 9
mcl_formspec.get_itemslot_bg_v4(0, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 8, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 8, 1, 1) ..

-- Ligne 10
mcl_formspec.get_itemslot_bg_v4(0, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 9, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 9, 1, 1) ..

-- Ligne 11
mcl_formspec.get_itemslot_bg_v4(0, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(1, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(2, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(3, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(4, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(5, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(6, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(7, 10, 1, 1) ..
mcl_formspec.get_itemslot_bg_v4(8, 10, 1, 1) ..



            "list[current_name;armor;0,4;5,1;]"..
            "list[current_name;offhand;6,4;10,1;]" ..
            "label[0,5;-------------------------------------------]"..
            "list[current_player;offhand;6,6;9,1;]" ..
            "list[current_player;armor;0,6;9,1;]"..
            "list[current_player;main;0,7;9,4;]"..
            "listring[]"..
            "button[5,5;3,1;transfer;" .. S("Transfer All") .. "]"
            chest_meta:set_string("formspec", chest_formspec)
        end
    end
end)
