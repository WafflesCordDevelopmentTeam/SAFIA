-- start
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

-- Command teleports (shortened names for locations)
local teleportLocations = {
    phaser = workspace:GetChildren()[222].Part,
    shop = workspace:GetChildren()[472].Shop.Part,
    pad2 = workspace:GetChildren()[470].Pad2,
    loc1931 = workspace:GetChildren()[1931],
    loc266 = workspace:GetChildren()[266].Part,
    diamond = workspace.diamondzonetp,
    loc2023 = workspace:GetChildren()[2023],
    loc39 = workspace:GetChildren()[39].Part,
    scythe = workspace["Bone Scythe Giver"].Pad2,
    rifle = workspace["Bloxy Rifle Giver"].Pad2,
    wrench = workspace["Wrench Giver"].Pad2,
    carpet = workspace.carpetgungiver.Pad2
}

-- Help command to display available teleport commands
local function displayHelp()
    local helpText = [[
Commands:
!phaser   - Teleports to workspace:GetChildren()[222].Part
!shop     - Teleports to workspace:GetChildren()[472].Shop.Part
!pad2     - Teleports to workspace:GetChildren()[470].Pad2
!loc1931  - Teleports to workspace:GetChildren()[1931]
!loc266   - Teleports to workspace:GetChildren()[266].Part
!diamond  - Teleports to workspace.diamondzonetp
!loc2023  - Teleports to workspace:GetChildren()[2023]
!loc39    - Teleports to workspace:GetChildren()[39].Part
!scythe   - Teleports to Bone Scythe Giver's Pad2
!rifle    - Teleports to Bloxy Rifle Giver's Pad2
!wrench   - Teleports to Wrench Giver's Pad2
!carpet   - Teleports to Carpet Gun Giver's Pad2
!all      - Teleports to all locations listed above
]]

    -- Display the help box
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teleport Commands",
        Text = helpText,
        Duration = 5
    })
end

-- Function to handle teleportation on chat
local function onChat(msg)
    local cmd = msg:lower()

    -- Handle teleport commands for specific locations
    if teleportLocations[cmd] and teleportLocations[cmd]:IsA("BasePart") then
        humanoidRootPart.CFrame = teleportLocations[cmd].CFrame + Vector3.new(0, 3, 0)
    end

    -- Handle !all command to teleport to all locations
    if cmd == "!all" then
        for _, location in pairs(teleportLocations) do
            if location and location:IsA("BasePart") then
                humanoidRootPart.CFrame = location.CFrame + Vector3.new(0, 3, 0)
                task.wait(0.5)  -- Wait for half a second between each teleport
            end
        end
    end

    -- Help command
    if cmd == "!help" then
        displayHelp()
    end
end

game.Players.LocalPlayer.Chatted:Connect(onChat)

-- Made By Pekora : discord -> pekoara