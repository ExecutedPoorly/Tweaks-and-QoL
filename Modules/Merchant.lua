
function TweaksAndQoL:RegisterMerchantOptions(options)

    options.args.merchant.args = {

        autoRepair = {
            type = "toggle",
            name = "Auto Repair",
            desc = "Automatically repair items at merchants.",
            order = 1,
        },

        sellJunk = {
            type = "toggle",
            name = "Sell Junk",
            desc = "Automatically sell gray items.",
            order = 2,
        },
    }

end