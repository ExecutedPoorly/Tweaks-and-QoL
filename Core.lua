local Addon = LibStub("AceAddon-3.0"):NewAddon(
    "TweaksAndQoL",
    "AceConsole-3.0",
    "AceEvent-3.0"
)

TweaksAndQoL = Addon

local defaults = {
    profile = {
        enabled = true,

        merchant = {
            autoRepair = true,
            autoVendor = true,
            printRepairCost = true,
        },

        loot = {
            autoLoot = true,
            fastLoot = true,
        },

        containers = {
            autoOpen = true,
        },

        confirmations = {
            autoDelete = false,
        },

        misc = {
            maxCameraDistance = true,
        },
    }
}

function Addon:OnInitialize()
    -- print("/tqol ")    
    self.db = LibStub("AceDB-3.0"):New(
        "TweaksAndQoLDB",
        defaults,
        true
    )
    --- self.db.profile.CvarsOrigial 
    self:RegisterOptions()
    --self:RegisterChatCommand({"tqol","Tweaks"}, "OpenOptions")
    
    self:Refresh()
    
end

function TweaksAndQoL:Refresh()

    if self.db.profile.autoLoot then
        SetCVar("autoLootDefault", "1")
    else
        SetCVar("autoLootDefault", "0")
    end

    if self.db.profile.fastLoot then
        self:RegisterEvent("LOOT_READY", "FastLoot")
    else
        self:UnregisterEvent("LOOT_READY") --check doesn't throw on init.
    end

end

