


function TweaksAndQoL:RegisterOptions()

    local options = {
        type = "group",
        name = "Tweaks and QoL",

        get = function(PassedVar)
            return TweaksAndQoL.db.profile[PassedVar[#PassedVar]]
        end,

        set = function(PassedVar, value)
            TweaksAndQoL.db.profile[PassedVar[#PassedVar]] = value
            print("Tweaks and QoL: " .. PassedVar[#PassedVar] .. " set to " .. tostring(value))
            TweaksAndQoL:Refresh()
        end,

        args = {

            merchant = {
                type = "group",
                name = "Merchant",
                order = 1,
                args = {},
            },

            loot = {
                type = "group",
                name = "Loot",
                order = 2,
                args = {},
            },

            containers = {
                type = "group",
                name = "Containers",
                order = 3,
                args = {},
            },

            confirmations = {
                type = "group",
                name = "Confirmations",
                order = 4,
                args = {},
            },

            misc = {
                type = "group",
                name = "Misc",
                order = 5,
                args = {},
            },
        
        },
    }
    -- self:RegisterMerchantOptions(options)
    self:RegisterLootOptions(options)
    -- self:RegisterMiscOptions(options)

    LibStub("AceConfig-3.0"):RegisterOptionsTable(
        "TweaksAndQoL",
        options
    )

    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(
        "TweaksAndQoL",
        "Tweaks and QoL"
    )
end