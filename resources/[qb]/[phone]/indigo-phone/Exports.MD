indigo-phone exports

# Crypto (Server side)

```

exports['indigo-phone']:RemoveCrypto(src, type, amount)

exports['indigo-phone']:hasEnough(src, type, amount)

exports['indigo-phone']:AddCrypto(src, type, amount)

```

# Employment (Server side)

```

exports['indigo-phone']:hireUser(Job, CID, grade)

exports['indigo-phone']:fireUser(Job, CID)

```

# Groups (Server Side)
```

exports['indigo-phone']:NotifyGroup(group, msg, type)

exports['indigo-phone']:pNotifyGroup(group, header, msg, icon, colour, length)

exports['indigo-phone']:CreateBlipForGroup(groupID, name, data)

exports['indigo-phone']:RemoveBlipForGroup(groupID, name)

exports['indigo-phone']:GetGroupByMembers(src)

exports['indigo-phone']:getGroupMembers(groupID)

exports['indigo-phone']:getGroupSize(groupID)

exports['indigo-phone']:GetGroupLeader(groupID)

exports['indigo-phone']:DestroyGroup(groupID)

exports['indigo-phone']:isGroupLeader(src, groupID)

--------------------------------------------------

exports['indigo-phone']:setJobStatus(groupID, status, stages)

exports['indigo-phone']:getJobStatus(groupID)

exports['indigo-phone']:resetJobStatus(groupID)

--------------------------------------------------

exports['indigo-phone']:isGroupTemp(groupID)

exports['indigo-phone']:CreateGroup(src, name, password)

```

# Notifications (Client side)

```

exports['indigo-phone']:PhoneNotification(title, text, icon, color, timeout, accept, deny)

```

# Twitter (Server side)

```

local function escape_str(s)
	return s
end

local TweetData = {
    firstName = PhoneData.PlayerData.charinfo.firstname,
    lastName = PhoneData.PlayerData.charinfo.lastname,
    citizenid = PhoneData.PlayerData.citizenid,
    message = escape_str(data.Message):gsub("[%<>\"()\'$]",""),
    time = data.Date,
    tweetId = "TWEET-"..math.random(11111111, 99999999),
    type = data.type,
    url = URL
}

exports['indigo-phone']:AddNewTweet(TweetData)

```
