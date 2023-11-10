local Translations = {
    command = {
        name = "richest",
        help = "Log the richest players,
    },
    message = {
        top_without_license = "%{name} (%{citizenid}) | %{money} | TOTAL MONEY: $%{totalMoney}`\n", --DO NOT REMOVE "`" AT THE END OF THIS STRING
        top_with_license = "%{name} (%{citizenid}) | %{license} | %{money} | TOTAL MONEY: $%{totalMoney}`\n", --DO NOT REMOVE "`" AT THE END OF THIS STRING
        short_top_message = "%{name} (%{citizenid}) | TOTAL MONEY: $%{totalMoney}`\n", --DO NOT REMOVE "`" AT THE END OF THIS STRING
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})