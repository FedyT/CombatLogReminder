local frame = CreateFrame("Frame")

-- File paths for your PNGs (inside your addon folder)
local GREEN_ICON = "Interface\\AddOns\\CombatLogReminder\\green.png"
local RED_ICON   = "Interface\\AddOns\\CombatLogReminder\\red.png"

-- Create reminder icon (movable)
local iconFrame = CreateFrame("Frame", "CombatLogStatusIcon", UIParent)
iconFrame:SetSize(16, 16) -- size on screen
iconFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
iconFrame:SetMovable(true)
iconFrame:EnableMouse(true)
iconFrame:RegisterForDrag("LeftButton")
iconFrame:SetScript("OnDragStart", iconFrame.StartMoving)
iconFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    CombatLogReminderDB = { self:GetPoint() }
end)

-- Add texture
iconFrame.texture = iconFrame:CreateTexture(nil, "OVERLAY")
iconFrame.texture:SetAllPoints()
iconFrame:Hide()

-- Restore saved position
local function RestorePosition()
    if CombatLogReminderDB then
        iconFrame:ClearAllPoints()
        iconFrame:SetPoint(unpack(CombatLogReminderDB))
    end
end

-- Utility: print colored message
local function PrintMessage(text, color)
    local r,g,b = 1,0,0
    if color == "green" then r,g,b = 0,1,0 end
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[CLR]|r "..text, r, g, b)
end

-- Update indicator & combat logging
local function UpdateCombatLog(force)
    local inInstance, instanceType = IsInInstance()
    if force == "on" or (inInstance and (instanceType == "party" or instanceType == "raid")) then
        if not LoggingCombat() then
            LoggingCombat(true)
            PrintMessage("Combat Log ENABLED ✅", "green")
        end
        iconFrame:Show()
        iconFrame.texture:SetTexture(GREEN_ICON)
    elseif force == "off" or not inInstance then
        if LoggingCombat() then
            LoggingCombat(false)
            PrintMessage("Combat Log DISABLED ❌", "red")
        end
        iconFrame:Show()
        iconFrame.texture:SetTexture(RED_ICON)
    end
end

-- Events
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, arg1, ...)
    if event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
        UpdateCombatLog()
    elseif event == "ADDON_LOADED" and arg1 == "CombatLogReminder" then
        RestorePosition()
    end
end)

------------------------------------------------
-- Slash Commands
------------------------------------------------
SLASH_CLON1 = "/clon"
SlashCmdList["CLON"] = function() UpdateCombatLog("on") end

SLASH_CLOFF1 = "/cloff"
SlashCmdList["CLOFF"] = function() UpdateCombatLog("off") end
