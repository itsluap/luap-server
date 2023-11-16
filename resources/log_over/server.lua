-- Oversized Texture Logger Script

-- Specify the path to the log file
local logFilePath = "A:/fivem-server/luap-server/resources/log_overoversized_texture_log.txt"

-- Function to log oversized texture warnings
function logOversizedTexture(message)
    local timestamp = os.date("[%Y-%m-%d %H:%M:%S]")
    local logMessage = timestamp .. " " .. message

    -- Open the log file in append mode
    local logFile = io.open(logFilePath, "a")

    if logFile then
        -- Write the log message and close the file
        logFile:write(logMessage .. "\n")
        logFile:close()
    else
        print("Error: Unable to open log file for writing")
    end
end

-- Event handler for the print event
AddEventHandler("print", function(message)
    -- Check if the message contains the keyword indicating an oversized texture warning
    if string.find(message, "Oversized assets") then
        logOversizedTexture(message)
    end
end)
