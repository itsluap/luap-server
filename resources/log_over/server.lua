local logFilePath = "A:/fivem-server/luap-server/resources/log_overoversized_texture_log.txt"

function logOversizedAsset(message)
    local timestamp = os.date("[%Y-%m-%d %H:%M:%S]")
    local logMessage = timestamp .. " " .. message

    local logFile = io.open(logFilePath, "a")

    if logFile then
        logFile:write(logMessage .. "\n")
        logFile:close()
        print("Log entry added:", logMessage)
    else
        print("Error: Unable to open log file for writing")
    end
end

-- Redirect stdout to capture server console output
io.stdout:flush()
io.stdout:setvbuf "no"
io.stdout = io.open("CON", "w")

AddEventHandler("onServerResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print("Oversized Asset Logger resource started.")
        logOversizedAsset("Resource started.")
    end
end)

AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print("Oversized Asset Logger resource stopped.")
        logOversizedAsset("Resource stopped.")
    end
end)

