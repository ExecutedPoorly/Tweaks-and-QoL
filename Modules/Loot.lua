function TweaksAndQoL:RegisterLootOptions(options)

    options.args.loot.args = {

        autoLoot = {
            type = "toggle",
            name = "Auto Loot",
            desc = "Automatically loot items.",
            order = 1,
        },

        fastLoot = {
            type = "toggle",
            name = "Fast Loot",
            desc = "Fast loot animation.",
            order = 2,
        },
    }

end
 

function TweaksAndQoL:RefreshLoot()

    if self.db.profile.loot.autoLoot then
        SetCVar("autoLootDefault", "1")
    else
        SetCVar("autoLootDefault", "0")
    end

    if self.db.profile.loot.fastLoot then
        self:RegisterEvent("LOOT_READY", "FastLoot")
    else
        self:UnregisterEvent("LOOT_READY")
    end

end

function TweaksAndQoL:FastLoot()

    for i = GetNumLootItems(), 1, -1 do
        LootSlot(i)
    end

end