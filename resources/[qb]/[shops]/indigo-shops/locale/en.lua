local Translations = {
    info = {
        open_shop = "[E] Shop",
        sell_chips = "[E] Sell Chips"
    },
    error = {
        dealer_decline = "The dealer declined to show you firearms, Speak with law enforcement to get a firearms license",
        --talk_cop = "Speak with law enforcement to get a firearms license"
    },
    success = {
        dealer_verify = "The dealer verified your license"
    },
}

Lang = Locale:new({phrases = Translations})