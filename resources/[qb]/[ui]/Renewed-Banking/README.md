# Renwed-Banking
<a href='https://ko-fi.com/ushifty' target='_blank'><img height='35' style='border:0px;height:46px;' src='https://az743702.vo.msecnd.net/cdn/kofi3.png?v=0' border='0' alt='Buy Me a Coffee at ko-fi.com' />
 
 [Renewed Discord](https://discord.gg/P3RMrbwA8n)

# Project Description
This resource was created by myself and was not a fork of any of the other banking resources. So lets not say "Isnt this x banking 🤓" because its not. The user interface was heavily inspired by No Pixels Banking Interface.
This resource is a replacement for qb-banking, qb-atm, qb-managment

# Dependencies
* [oxmysql](https://github.com/overextended/oxmysql)
* [QBCore](https://github.com/qbcore-framework/qb-core)
* [indigo-target](https://github.com/qbcore-framework/indigo-target)
* [indigo-menu](https://github.com/qbcore-framework/indigo-menu)
* [indigo-input](https://github.com/qbcore-framework/indigo-input)
* [progressbars](https://github.com/Project-Sloth/progressbar)

# Features
* Personal, Job, Gang, Shared Accounts
* Withdraw, Deposit, Transfer between accounts
* Offline Player Full Support
* QB Target Support
* Optimized Resource (0.00ms Running At All Times)

# Installation

1) Insert the SQL provided

2) Edit your QBCore/Shared/jobs.lua and add `bankAuth = true` to the job grades which have access to society funds

## Transaction Integrations

```lua
exports['Renwed-Banking']:handleTransaction(account, title, amount, message, issuer, receiver, type, transID)
 ---@param account<string> - job name or citizenid
 ---@param title<string> - Title of transaction example `Personal Account / ${Player.PlayerData.citizenid}`
 ---@param amount<number> - Amount of money being transacted
 ---@param message<string> - Description of transaction
 ---@param issuer<string> - Name of Business or Character issuing the bill
 ---@param receiver<string> - Name of Business or Character receiving the bill
 ---@param type<string> - deposit | withdraw
 ---@param transID<string> - (optional) Force a specific transaction ID instead of generating one.

---@return transaction<table> {
  ---@param trans_id<string> - Transaction ID for the created transaction
  ---@param amount<number> - Amount of money being transacted
  ---@param trans_type<string> - deposit | withdraw
  ---@param receiver<string> - Name of Business or Character receiving the bill
  ---@param message<string> - Description of transaction
  ---@param issuer<string> - Name of Business or Character issuing the bill
  ---@param time<number> - Epoch timestamp of transaction
---}


exports['Renwed-Banking']:getAccountMoney(account)
 ---@param account<string> - Job Name | Custom Account Name

---@return amount<number> - Amount of money account has or false

exports['Renwed-Banking']:addAccountMoney(account, amount)
 ---@param account<string> - Job Name | Custom Account Name
  ---@param amount<number> - Amount of money being transacted

---@return complete<boolean> - true | false

exports['Renwed-Banking']:removeAccountMoney(account, amount)
 ---@param account<string> - Job Name | Custom Account Name
  ---@param amount<number> - Amount of money being transacted

---@return complete<boolean> - true | false
```

## qb-managment conversion
```lua
exports['indigo-management']:GetAccount => exports['Renwed-Banking']:getAccountMoney
exports['indigo-management']:AddMoney => exports['Renwed-Banking']:addAccountMoney
exports['indigo-management']:RemoveMoney => exports['Renwed-Banking']:removeAccountMoney
exports['indigo-management']:GetGangAccount=> exports['Renwed-Banking']:getAccountMoney
exports['indigo-management']:AddGangMoney=> exports['Renwed-Banking']:addAccountMoney
exports['indigo-management']:RemoveGangMoney=> exports['Renwed-Banking']:removeAccountMoney
```

 ## Change Logs
 V1.0.1
 ```
 Added Banking Blips
 ```
