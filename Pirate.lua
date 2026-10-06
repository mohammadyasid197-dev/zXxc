-- [[ ZABr0om PIRATE v4 - by ZBN|ZAB ]] --
-- Multi Password + Rainbow Theme
-- 6 Password Valid

-- ============ MULTI PASSWORD ============
local VALID_PASSWORDS = {
    "ZabProKILER123zc",
    "XCCCTYNNIC",
    "ZBNTROJANPRO",
    "FGERYAGHHTSH",
    "CCVIYYGRATIH",
    "FVProGGG7"
}

local MAX_ATTEMPTS = 5
local attempts = 0
local passwordPassed = false

-- ============ SAFE PARENT ============
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LP = Players.LocalPlayer

local function getSafeParent()
    local ok, hui = pcall(function() return gethui() end)
    if ok and hui then return hui end
    local ok2, cg = pcall(function() return CoreGui end)
    if ok2 and cg then return cg end
    return LP:WaitForChild("PlayerGui")
end

local GuiParent = getSafeParent()

pcall(function()
    local old = GuiParent:FindFirstChild("ZABr0om_Pirate")
    if old then old:Destroy() end
    local oldPw = GuiParent:FindFirstChild("ZABr0om_Password")
    if oldPw then oldPw:Destroy() end
end)

-- ============ WARNA TEMA ============
local C = {
    Void       = Color3.fromRGB(18, 12, 28),
    Panel      = Color3.fromRGB(28, 20, 42),
    PanelDark  = Color3.fromRGB(22, 15, 34),
    Header     = Color3.fromRGB(45, 25, 70),
    Border     = Color3.fromRGB(140, 90, 220),
    BorderSoft = Color3.fromRGB(100, 60, 160),
    Button     = Color3.fromRGB(50, 32, 78),
    ButtonHover= Color3.fromRGB(75, 45, 115),
    ButtonOn   = Color3.fromRGB(120, 70, 190),
    Text       = Color3.fromRGB(235, 225, 255),
    TextDim    = Color3.fromRGB(170, 150, 210),
    Accent     = Color3.fromRGB(200, 140, 255),
    Success    = Color3.fromRGB(150, 255, 180),
    Danger     = Color3.fromRGB(255, 100, 130),
    Gold       = Color3.fromRGB(255, 215, 130),
}

-- ============ PASSWORD GUI ============
local PwUI = Instance.new("ScreenGui")
PwUI.Name = "ZABr0om_Password"
PwUI.ResetOnSpawn = false
PwUI.IgnoreGuiInset = true
PwUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PwUI.Parent = GuiParent

local PwPanel = Instance.new("Frame", PwUI)
PwPanel.Size = UDim2.new(0, 280, 0, 190)
PwPanel.Position = UDim2.new(0.5, -140, 0.5, -95)
PwPanel.BackgroundColor3 = C.Panel
PwPanel.BorderSizePixel = 0
PwPanel.Active = true
Instance.new("UICorner", PwPanel).CornerRadius = UDim.new(0, 10)

local PwStroke = Instance.new("UIStroke", PwPanel)
PwStroke.Thickness = 1.5
PwStroke.Color = C.Border

local PwStrokeGrad = Instance.new("UIGradient", PwStroke)
PwStrokeGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(140, 90, 220)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(200, 140, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 90, 220)),
})
PwStrokeGrad.Rotation = 45

local PwHeader = Instance.new("Frame", PwPanel)
PwHeader.Size = UDim2.new(1, 0, 0, 42)
PwHeader.BackgroundColor3 = C.Header
PwHeader.BorderSizePixel = 0
Instance.new("UICorner", PwHeader).CornerRadius = UDim.new(0, 10)

local PwHeaderFix = Instance.new("Frame", PwHeader)
PwHeaderFix.Size = UDim2.new(1, 0, 0, 12)
PwHeaderFix.Position = UDim2.new(0, 0, 1, -12)
PwHeaderFix.BackgroundColor3 = C.Header
PwHeaderFix.BorderSizePixel = 0

local PwHeaderGrad = Instance.new("UIGradient", PwHeader)
PwHeaderGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(50, 28, 78)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(65, 38, 100)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(50, 28, 78)),
})

local LockIcon = Instance.new("TextLabel", PwHeader)
LockIcon.Size = UDim2.new(0, 32, 0, 32)
LockIcon.Position = UDim2.new(0, 8, 0.5, -16)
LockIcon.BackgroundTransparency = 1
LockIcon.Text = "🔐"
LockIcon.TextSize = 22
LockIcon.Font = Enum.Font.GothamBold
LockIcon.ZIndex = 2

local PwTitle = Instance.new("TextLabel", PwHeader)
PwTitle.Size = UDim2.new(1, -50, 0, 18)
PwTitle.Position = UDim2.new(0, 48, 0, 5)
PwTitle.BackgroundTransparency = 1
PwTitle.Text = "ZABr0om PIRATE v4"
PwTitle.TextColor3 = C.Accent
PwTitle.Font = Enum.Font.GothamBlack
PwTitle.TextSize = 14
PwTitle.TextXAlignment = Enum.TextXAlignment.Left
PwTitle.ZIndex = 2

local PwSubTitle = Instance.new("TextLabel", PwHeader)
PwSubTitle.Size = UDim2.new(1, -50, 0, 12)
PwSubTitle.Position = UDim2.new(0, 48, 0, 24)
PwSubTitle.BackgroundTransparency = 1
PwSubTitle.Text = "🔑 6 Password Valid | by ZBN|ZAB"
PwSubTitle.TextColor3 = C.TextDim
PwSubTitle.Font = Enum.Font.GothamMedium
PwSubTitle.TextSize = 9
PwSubTitle.TextXAlignment = Enum.TextXAlignment.Left
PwSubTitle.ZIndex = 2

local PwInfo = Instance.new("TextLabel", PwPanel)
PwInfo.Size = UDim2.new(1, -20, 0, 20)
PwInfo.Position = UDim2.new(0, 10, 0, 50)
PwInfo.BackgroundTransparency = 1
PwInfo.Text = "▸ Masukkan salah satu password:"
PwInfo.TextColor3 = C.TextDim
PwInfo.Font = Enum.Font.GothamMedium
PwInfo.TextSize = 10
PwInfo.TextXAlignment = Enum.TextXAlignment.Left

local PwInput = Instance.new("TextBox", PwPanel)
PwInput.Size = UDim2.new(1, -20, 0, 32)
PwInput.Position = UDim2.new(0, 10, 0, 74)
PwInput.BackgroundColor3 = C.PanelDark
PwInput.BorderSizePixel = 0
PwInput.PlaceholderText = "••••••••••••"
PwInput.Text = ""
PwInput.PlaceholderColor3 = C.TextDim
PwInput.TextColor3 = C.Text
PwInput.Font = Enum.Font.Code
PwInput.TextSize = 13
PwInput.ClearTextOnFocus = false
Instance.new("UICorner", PwInput).CornerRadius = UDim.new(0, 6)
local PwInputStroke = Instance.new("UIStroke", PwInput)
PwInputStroke.Thickness = 1
PwInputStroke.Color = C.BorderSoft
PwInputStroke.Transparency = 0.5

local SubmitBtn = Instance.new("TextButton", PwPanel)
SubmitBtn.Size = UDim2.new(1, -20, 0, 34)
SubmitBtn.Position = UDim2.new(0, 10, 0, 112)
SubmitBtn.BackgroundColor3 = C.Button
SubmitBtn.BorderSizePixel = 0
SubmitBtn.Text = "🔓 UNLOCK"
SubmitBtn.TextColor3 = C.Accent
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 13
SubmitBtn.AutoButtonColor = false
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 6)

local SubmitStroke = Instance.new("UIStroke", SubmitBtn)
SubmitStroke.Thickness = 1
SubmitStroke.Color = C.BorderSoft

SubmitBtn.MouseEnter:Connect(function()
    SubmitBtn.BackgroundColor3 = C.ButtonHover
    SubmitStroke.Color = C.Accent
end)
SubmitBtn.MouseLeave:Connect(function()
    SubmitBtn.BackgroundColor3 = C.Button
    SubmitStroke.Color = C.BorderSoft
end)

local PwStatus = Instance.new("TextLabel", PwPanel)
PwStatus.Size = UDim2.new(1, -20, 0, 14)
PwStatus.Position = UDim2.new(0, 10, 1, -20)
PwStatus.BackgroundTransparency = 1
PwStatus.Text = "Sisa percobaan: " .. MAX_ATTEMPTS
PwStatus.TextColor3 = C.TextDim
PwStatus.Font = Enum.Font.GothamMedium
PwStatus.TextSize = 9
PwStatus.TextXAlignment = Enum.TextXAlignment.Left

-- ============ CHECK PASSWORD ============
local function checkPassword()
    local input = PwInput.Text
    
    local isValid = false
    for _, pw in ipairs(VALID_PASSWORDS) do
        if input == pw then
            isValid = true
            break
        end
    end
    
    if isValid then
        passwordPassed = true
        PwStatus.Text = "✅ Password benar! Loading..."
        PwStatus.TextColor3 = C.Success
        PwInputStroke.Color = C.Success
        
        task.wait(0.5)
        
        local tween = game:GetService("TweenService"):Create(PwPanel, 
            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}
        )
        tween:Play()
        tween.Completed:Connect(function()
            PwUI:Destroy()
        end)
        
        return true
    else
        attempts = attempts + 1
        local left = MAX_ATTEMPTS - attempts
        
        if left <= 0 then
            PwStatus.Text = "❌ TERLALU BANYAK PERCOBAAN!"
            PwStatus.TextColor3 = C.Danger
            PwInputStroke.Color = C.Danger
            PwInput.Text = ""
            
            task.wait(1)
            
            PwPanel.Size = UDim2.new(0, 0, 0, 0)
            PwUI:Destroy()
            
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "❌ ACCESS DENIED",
                Text = "Password salah " .. MAX_ATTEMPTS .. "x. Script diblokir!",
                Duration = 5
            })
            return false
        else
            PwStatus.Text = "❌ Password salah! Sisa: " .. left
            PwStatus.TextColor3 = C.Danger
            PwInputStroke.Color = C.Danger
            PwInput.Text = ""
            
            local origPos = PwPanel.Position
            for i = 1, 6 do
                PwPanel.Position = UDim2.new(origPos.X.Scale, origPos.X.Offset + (i % 2 == 0 and 8 or -8), origPos.Y.Scale, origPos.Y.Offset)
                task.wait(0.04)
            end
            PwPanel.Position = origPos
            
            task.wait(0.5)
            PwInputStroke.Color = C.BorderSoft
        end
        return false
    end
end

SubmitBtn.MouseButton1Click:Connect(checkPassword)
PwInput.FocusLost:Connect(function(enter)
    if enter then checkPassword() end
end)

PwPanel.Size = UDim2.new(0, 0, 0, 0)
PwPanel.BackgroundTransparency = 1
game:GetService("TweenService"):Create(PwPanel, 
    TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 280, 0, 190), BackgroundTransparency = 0}
):Play()

-- Drag PW
local pwDragging, pwDragStart, pwStartPos
PwHeader.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        pwDragging = true
        pwDragStart = input.Position
        pwStartPos = PwPanel.Position
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if pwDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - pwDragStart
        PwPanel.Position = UDim2.new(pwStartPos.X.Scale, pwStartPos.X.Offset + d.X, pwStartPos.Y.Scale, pwStartPos.Y.Offset + d.Y)
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        pwDragging = false
    end
end)

-- ============ TUNGGU PASSWORD ============
repeat task.wait(0.1) until passwordPassed

-- ============================================
-- SCRIPT UTAMA
-- ============================================

if getgenv and getgenv().ZABr0omV4 then
    for _, c in pairs(getgenv().ZABr0omV4) do
        pcall(function() c:Disconnect() end)
    end
end
getgenv().ZABr0omV4 = {}

local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")

local function notify(t, x)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title=t, Text=x, Duration=3})
    end)
end

-- ============ UI UTAMA ============
local UI = Instance.new("ScreenGui")
UI.Name = "ZABr0om_Pirate"
UI.ResetOnSpawn = false
UI.IgnoreGuiInset = true
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UI.Parent = GuiParent

local Panel = Instance.new("Frame", UI)
Panel.Name = "Panel"
Panel.Size = UDim2.new(0, 280, 0, 340)
Panel.Position = UDim2.new(0.5, -140, 0.5, -170)
Panel.BackgroundColor3 = C.Panel
Panel.BorderSizePixel = 0
Panel.Active = true
Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, 10)

local PanelStroke = Instance.new("UIStroke", Panel)
PanelStroke.Thickness = 2
PanelStroke.Color = C.Border

-- Gradient warna warni (rainbow)
local PanelStrokeGrad = Instance.new("UIGradient", PanelStroke)
PanelStrokeGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 80, 80)),
    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 200, 80)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(180, 255, 80)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(80, 255, 200)),
    ColorSequenceKeypoint.new(0.67, Color3.fromRGB(80, 200, 255)),
    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(180, 80, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 80, 200)),
})
PanelStrokeGrad.Rotation = 45

local Header = Instance.new("Frame", Panel)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = C.Header
Header.BorderSizePixel = 0
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 10)

local HeaderFix = Instance.new("Frame", Header)
HeaderFix.Size = UDim2.new(1, 0, 0, 12)
HeaderFix.Position = UDim2.new(0, 0, 1, -12)
HeaderFix.BackgroundColor3 = C.Header
HeaderFix.BorderSizePixel = 0

local HeaderGrad = Instance.new("UIGradient", Header)
HeaderGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(50, 28, 78)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(65, 38, 100)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(50, 28, 78)),
})

local Flag = Instance.new("TextLabel", Header)
Flag.Size = UDim2.new(0, 32, 0, 32)
Flag.Position = UDim2.new(0, 6, 0.5, -16)
Flag.BackgroundTransparency = 1
Flag.Text = "🏴‍☠️"
Flag.TextSize = 24
Flag.Font = Enum.Font.GothamBold
Flag.ZIndex = 2

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -120, 0, 18)
Title.Position = UDim2.new(0, 42, 0, 4)
Title.BackgroundTransparency = 1
Title.Text = "ZABr0om PIRATE v4"
Title.TextColor3 = C.Accent
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 2

local SubTitle = Instance.new("TextLabel", Header)
SubTitle.Size = UDim2.new(1, -120, 0, 12)
SubTitle.Position = UDim2.new(0, 42, 0, 22)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "@" .. LP.Name .. " • Rainbow"
SubTitle.TextColor3 = C.TextDim
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.TextSize = 9
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.ZIndex = 2

local MinBtn = Instance.new("TextButton", Header)
MinBtn.Size = UDim2.new(0, 22, 0, 22)
MinBtn.Position = UDim2.new(1, -52, 0.5, -11)
MinBtn.BackgroundColor3 = C.Button
MinBtn.BorderSizePixel = 0
MinBtn.Text = "−"
MinBtn.TextColor3 = C.Text
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
MinBtn.ZIndex = 5
MinBtn.AutoButtonColor = false
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 5)

local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Position = UDim2.new(1, -28, 0.5, -11)
CloseBtn.BackgroundColor3 = C.Danger
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.ZIndex = 5
CloseBtn.AutoButtonColor = false
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 5)

local Content = Instance.new("ScrollingFrame", Panel)
Content.Size = UDim2.new(1, -12, 1, -48)
Content.Position = UDim2.new(0, 6, 0, 42)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 3
Content.ScrollBarImageColor3 = C.BorderSoft
Content.CanvasSize = UDim2.new(0, 0, 0, 800)

local uiList = Instance.new("UIListLayout", Content)
uiList.Padding = UDim.new(0, 4)
uiList.SortOrder = Enum.SortOrder.LayoutOrder

local uiPad = Instance.new("UIPadding", Content)
uiPad.PaddingTop = UDim.new(0, 4)
uiPad.PaddingLeft = UDim.new(0, 2)
uiPad.PaddingRight = UDim.new(0, 2)

-- ============ RAINBOW COLOR FUNCTION ============
local function rainbowColor(t, offset)
    local cycle = (t * 0.2 + (offset or 0) * 0.1) % 1
    if cycle < 0.17 then
        return Color3.fromRGB(255, 80, 80):Lerp(Color3.fromRGB(255, 200, 80), cycle / 0.17)
    elseif cycle < 0.33 then
        return Color3.fromRGB(255, 200, 80):Lerp(Color3.fromRGB(180, 255, 80), (cycle - 0.17) / 0.16)
    elseif cycle < 0.50 then
        return Color3.fromRGB(180, 255, 80):Lerp(Color3.fromRGB(80, 255, 200), (cycle - 0.33) / 0.17)
    elseif cycle < 0.67 then
        return Color3.fromRGB(80, 255, 200):Lerp(Color3.fromRGB(80, 200, 255), (cycle - 0.50) / 0.17)
    elseif cycle < 0.83 then
        return Color3.fromRGB(80, 200, 255):Lerp(Color3.fromRGB(180, 80, 255), (cycle - 0.67) / 0.16)
    else
        return Color3.fromRGB(180, 80, 255):Lerp(Color3.fromRGB(255, 80, 200), (cycle - 0.83) / 0.17)
    end
end

local allStrokes = {}

local function makeBtn(txt, callback)
    local b = Instance.new("TextButton", Content)
    b.Size = UDim2.new(1, 0, 0, 30)
    b.BackgroundColor3 = C.Button
    b.BorderSizePixel = 0
    b.Text = txt
    b.TextColor3 = C.Text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 11
    b.AutoButtonColor = false
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    
    local s = Instance.new("UIStroke", b)
    s.Thickness = 1
    s.Color = Color3.fromRGB(255, 80, 80)  -- akan di-update rainbow
    table.insert(allStrokes, s)
    
    b.MouseEnter:Connect(function()
        s.Thickness = 1.5
        b.BackgroundColor3 = C.ButtonHover
    end)
    b.MouseLeave:Connect(function()
        s.Thickness = 1
        b.BackgroundColor3 = (b:GetAttribute("on") and C.ButtonOn) or C.Button
    end)
    b.MouseButton1Click:Connect(callback)
    return b
end

local function makeSection(txt)
    local l = Instance.new("TextLabel", Content)
    l.Size = UDim2.new(1, 0, 0, 18)
    l.BackgroundTransparency = 1
    l.Text = "▸ " .. txt
    l.TextColor3 = Color3.fromRGB(255, 200, 80)
    l.Font = Enum.Font.GothamBlack
    l.TextSize = 10
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end

-- ============ STATE ============
local pirateMode = false
local orbitMode = false
local espEnabled = false
local viewActive = false
local flingActive = false
local autoPirateMode = false
local targetPlayer = nil
local currentShip = nil
local spinSpeed = 25
local bantingPower = 800
local orbitAngle = 0
local orbitRadius = 9
local orbitHeight = 0
local orbitSpeed = 2.5
local flingLoop = nil
local spinLoop = nil
local scanAccum = 0

local function getRoot(plr)
    if not plr or not plr.Character then return nil end
    return plr.Character:FindFirstChild("HumanoidRootPart")
end

local AnchorFolder = Instance.new("Folder", Workspace)
AnchorFolder.Name = "ZABr0om_Anchor"

local AnchorPart = Instance.new("Part", AnchorFolder)
AnchorPart.Name = "AnchorPart"
AnchorPart.Anchored = true
AnchorPart.CanCollide = false
AnchorPart.Transparency = 1
AnchorPart.Size = Vector3.new(1, 1, 1)
AnchorPart.CFrame = CFrame.new(0, 500, 0)

local AnchorAttach = Instance.new("Attachment", AnchorPart)

if not getgenv().ZABr0om_Net then
    getgenv().ZABr0om_Net = {Parts = {}, Active = false}
end

task.spawn(function()
    while UI.Parent do
        pcall(function()
            if sethiddenproperty then
                sethiddenproperty(LP, "SimulationRadius", math.huge)
                sethiddenproperty(LP, "MaxSimulationRadius", math.huge)
            end
        end)
        task.wait(0.5)
    end
end)

local function Manipulate(v)
    if not v or not v.Parent then return end
    if not v:IsA("BasePart") then return end
    if v.Anchored then return end
    if v:IsDescendantOf(LP.Character) then return end
    
    local parent = v.Parent
    if parent and parent:FindFirstChildOfClass("Humanoid") then return end
    if parent and parent:IsA("Tool") then return end
    if v.Name == "Handle" or v.Name == "AnchorPart" then return end
    
    pcall(function()
        v.CanCollide = false
        v.Massless = false
        pcall(function() v:SetNetworkOwner(LP) end)
        
        if not table.find(getgenv().ZABr0om_Net.Parts, v) then
            table.insert(getgenv().ZABr0om_Net.Parts, v)
        end
        
        local att = v:FindFirstChild("ZB_Att")
        if not att then
            att = Instance.new("Attachment", v)
            att.Name = "ZB_Att"
        end
        
        local orient = v:FindFirstChild("ZB_Orient")
        if not orient then
            orient = Instance.new("AlignOrientation", v)
            orient.Name = "ZB_Orient"
        end
        orient.Attachment0 = att
        orient.Mode = Enum.OrientationAlignmentMode.OneAttachment
        orient.MaxTorque = math.huge
        orient.Responsiveness = 100
        
        local align = v:FindFirstChild("ZB_Align")
        if not align then
            align = Instance.new("AlignPosition", v)
            align.Name = "ZB_Align"
        end
        align.Attachment0 = att
        align.Attachment1 = AnchorAttach
        align.MaxForce = math.huge
        align.MaxVelocity = math.huge
        align.Responsiveness = 500
        align.Enabled = not orbitMode
    end)
end

local function clearAllParts()
    for i = #getgenv().ZABr0om_Net.Parts, 1, -1 do
        local p = getgenv().ZABr0om_Net.Parts[i]
        if p and p.Parent then
            pcall(function()
                local a = p:FindFirstChild("ZB_Align")
                if a then a:Destroy() end
                local o = p:FindFirstChild("ZB_Orient")
                if o then o:Destroy() end
                local at = p:FindFirstChild("ZB_Att")
                if at then at:Destroy() end
                p.Velocity = Vector3.zero
            end)
        end
        table.remove(getgenv().ZABr0om_Net.Parts, i)
    end
end

-- ESP
local function createESP(player)
    if player == LP or not player.Character then return end
    if player.Character:FindFirstChild("ZAB_ESP") then return end
    
    local hl = Instance.new("Highlight")
    hl.Name = "ZAB_ESP"
    hl.Adornee = player.Character
    hl.FillColor = rainbowColor(tick(), 0)
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.FillTransparency = 0.6
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = player.Character
    
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    if root then
        local bb = Instance.new("BillboardGui")
        bb.Name = "ZAB_ESP_Name"
        bb.Size = UDim2.new(0, 200, 0, 36)
        bb.StudsOffset = Vector3.new(0, 3, 0)
        bb.AlwaysOnTop = true
        bb.Parent = root
        
        local nameLbl = Instance.new("TextLabel", bb)
        nameLbl.Size = UDim2.new(1, 0, 0.5, 0)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = player.Name
        nameLbl.TextColor3 = Color3.fromRGB(255, 200, 80)
        nameLbl.TextStrokeTransparency = 0
        nameLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameLbl.Font = Enum.Font.GothamBold
        nameLbl.TextSize = 12
        
        local distLbl = Instance.new("TextLabel", bb)
        distLbl.Name = "DistLbl"
        distLbl.Size = UDim2.new(1, 0, 0.5, 0)
        distLbl.Position = UDim2.new(0, 0, 0.5, 0)
        distLbl.BackgroundTransparency = 1
        distLbl.Text = "[--]"
        distLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        distLbl.TextStrokeTransparency = 0
        distLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distLbl.Font = Enum.Font.GothamMedium
        distLbl.TextSize = 10
    end
end

local function removeESP(player)
    if not player or not player.Character then return end
    local hl = player.Character:FindFirstChild("ZAB_ESP")
    if hl then hl:Destroy() end
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    if root then
        local bb = root:FindFirstChild("ZAB_ESP_Name")
        if bb then bb:Destroy() end
    end
end

local function updateESPDistance()
    local myRoot = getRoot(LP)
    if not myRoot then return end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if r then
                local bb = r:FindFirstChild("ZAB_ESP_Name")
                if bb then
                    local d = bb:FindFirstChild("DistLbl")
                    if d then
                        d.Text = "[" .. math.floor((r.Position - myRoot.Position).Magnitude) .. " studs]"
                    end
                end
            end
        end
    end
end

-- Pirate
local function spawnPirateShip()
    for _, tool in ipairs(LP.Backpack:GetChildren()) do
        local n = tool.Name:lower()
        if n:find("pirate") or n:find("boat") or n:find("ship") then
            pcall(function() tool.Parent = LP.Character end)
            task.wait(0.3)
            return tool
        end
    end
    return nil
end

local function mountShip(ship)
    if not ship then return false end
    local char = LP.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return false end
    for _, seat in ipairs(ship:GetDescendants()) do
        if seat:IsA("VehicleSeat") or seat:IsA("Seat") then
            pcall(function() seat:Sit(hum) end)
            return true
        end
    end
    return false
end

local function teleportToTarget()
    if not targetPlayer then return false end
    local myRoot = getRoot(LP)
    local tRoot = getRoot(targetPlayer)
    if not myRoot or not tRoot then return false end
    myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, -3)
    return true
end

local function startFling()
    if flingLoop then flingLoop:Disconnect() end
    flingActive = true
    flingLoop = RunService.Heartbeat:Connect(function()
        if not flingActive or not targetPlayer then return end
        local tRoot = getRoot(targetPlayer)
        local myRoot = getRoot(LP)
        if not tRoot or not myRoot then return end
        myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, 0.5)
        tRoot.Velocity = Vector3.new(math.random(-bantingPower, bantingPower), bantingPower * 1.5, math.random(-bantingPower, bantingPower))
    end)
end

local function stopFling()
    flingActive = false
    if flingLoop then flingLoop:Disconnect() flingLoop = nil end
end

local function startSpin()
    if spinLoop then spinLoop:Disconnect() end
    local spinAngle = 0
    spinLoop = RunService.Heartbeat:Connect(function()
        if not autoPirateMode or not targetPlayer or not currentShip then return end
        local tRoot = getRoot(targetPlayer)
        if not tRoot then return end
        spinAngle = (spinAngle + spinSpeed) % 360
        local spinCF = CFrame.new(tRoot.Position) * CFrame.Angles(0, math.rad(spinAngle), 0) * CFrame.new(0, 5, 3)
        pcall(function() currentShip:PivotTo(spinCF) end)
        tRoot.Velocity = Vector3.new(math.random(-bantingPower, bantingPower), bantingPower * 1.5, math.random(-bantingPower, bantingPower))
        tRoot.AssemblyAngularVelocity = Vector3.new(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
    end)
end

local function stopSpin()
    autoPirateMode = false
    if spinLoop then spinLoop:Disconnect() spinLoop = nil end
end

-- ============ BUTTONS ============
makeSection("🏴‍☠️ PIRATE")

local pirateBtn = makeBtn("🏴‍☠️ Pirate Mode: OFF", function()
    pirateMode = not pirateMode
    if pirateMode then
        pirateBtn.Text = "🏴‍☠️ Pirate Mode: ON"
        pirateBtn.TextColor3 = Color3.fromRGB(255, 220, 100)
        pirateBtn:SetAttribute("on", true)
        pirateBtn.BackgroundColor3 = C.ButtonOn
    else
        pirateBtn.Text = "🏴‍☠️ Pirate Mode: OFF"
        pirateBtn.TextColor3 = C.Text
        pirateBtn:SetAttribute("on", false)
        pirateBtn.BackgroundColor3 = C.Button
    end
end)

local spawnBtn = makeBtn("⚓ Spawn Kapal Bajak Laut", function()
    local s = spawnPirateShip()
    if s then
        currentShip = s
        notify("⚓", "Kapal ditemukan!")
    else
        notify("⚠️", "Kapal tidak ada.")
    end
end)

local mountBtn = makeBtn("🛶 Naik ke Kapal", function()
    if currentShip and mountShip(currentShip) then
        notify("🛶", "Naik kapal!")
    else
        notify("⚠️", "Gagal naik")
    end
end)

makeSection("🎯 TARGET")

local targetBox = Instance.new("TextBox", Content)
targetBox.Size = UDim2.new(1, 0, 0, 30)
targetBox.BackgroundColor3 = C.PanelDark
targetBox.BorderSizePixel = 0
targetBox.PlaceholderText = "⌨ Ketik nama target + Enter"
targetBox.TextColor3 = C.Text
targetBox.PlaceholderColor3 = C.TextDim
targetBox.Font = Enum.Font.GothamMedium
targetBox.TextSize = 11
targetBox.ClearTextOnFocus = false
Instance.new("UICorner", targetBox).CornerRadius = UDim.new(0, 6)
local tbs = Instance.new("UIStroke", targetBox)
tbs.Thickness = 1
tbs.Color = Color3.fromRGB(80, 255, 200)
table.insert(allStrokes, tbs)

targetBox.FocusLost:Connect(function(enter)
    if not enter then return end
    local key = targetBox.Text:lower()
    if key == "" then return end
    local found = false
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and (p.Name:lower():find(key, 1, true) or p.DisplayName:lower():find(key, 1, true)) then
            targetPlayer = p
            targetBox.Text = p.DisplayName
            found = true
            notify("🎯", "Target: " .. p.DisplayName)
            break
        end
    end
    if not found then
        targetBox.Text = "[TIDAK DITEMUKAN]"
        task.wait(1)
        targetBox.Text = ""
    end
end)

makeSection("⚡ ACTIONS")

local tpBtn = makeBtn("⚡ Teleport ke Target", function()
    if teleportToTarget() then
        notify("⚡", "Teleport!")
    else
        notify("⚠️", "Gagal teleport")
    end
end)

local flingBtn = makeBtn("💥 Fling Target: OFF", function()
    if flingActive then
        stopFling()
        flingBtn.Text = "💥 Fling Target: OFF"
        flingBtn.TextColor3 = C.Text
        flingBtn:SetAttribute("on", false)
        flingBtn.BackgroundColor3 = C.Button
    else
        if targetPlayer then
            startFling()
            flingBtn.Text = "💥 Fling Target: ON"
            flingBtn.TextColor3 = C.Danger
            flingBtn:SetAttribute("on", true)
            flingBtn.BackgroundColor3 = C.ButtonOn
        else
            notify("⚠️", "Pilih target dulu")
        end
    end
end)

local spinBtn = makeBtn("🌀 Spin + Banting: OFF", function()
    if autoPirateMode then
        stopSpin()
        spinBtn.Text = "🌀 Spin + Banting: OFF"
        spinBtn.TextColor3 = C.Text
        spinBtn:SetAttribute("on", false)
        spinBtn.BackgroundColor3 = C.Button
    else
        if targetPlayer and currentShip then
            autoPirateMode = true
            startSpin()
            spinBtn.Text = "🌀 Spin + Banting: ON"
            spinBtn.TextColor3 = Color3.fromRGB(180, 80, 255)
            spinBtn:SetAttribute("on", true)
            spinBtn.BackgroundColor3 = C.ButtonOn
        else
            notify("⚠️", "Pilih target + spawn kapal")
        end
    end
end)

local flingAllBtn = makeBtn("💀 Fling Semua Player", function()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP then
            local t = getRoot(p)
            if t then
                t.Velocity = Vector3.new(math.random(-500, 500), math.random(800, 2000), math.random(-500, 500))
            end
        end
    end
    notify("💀", "Fling semua!")
end)

makeSection("🌀 PARTS ORBIT")

local orbitBtn = makeBtn("🌀 Orbit Me: OFF", function()
    orbitMode = not orbitMode
    if orbitMode then
        orbitBtn.Text = "🌀 Orbit Me: ON"
        orbitBtn.TextColor3 = Color3.fromRGB(80, 200, 255)
        orbitBtn:SetAttribute("on", true)
        orbitBtn.BackgroundColor3 = C.ButtonOn
        for _, p in ipairs(getgenv().ZABr0om_Net.Parts) do
            local a = p:FindFirstChild("ZB_Align")
            if a then a.Enabled = false end
        end
    else
        orbitBtn.Text = "🌀 Orbit Me: OFF"
        orbitBtn.TextColor3 = C.Text
        orbitBtn:SetAttribute("on", false)
        orbitBtn.BackgroundColor3 = C.Button
    end
end)

local activateBtn = makeBtn("⚡ Activate Parts: OFF", function()
    if not getgenv().ZABr0om_Net.Active then
        getgenv().ZABr0om_Net.Active = true
        activateBtn.Text = "⚡ Activate Parts: ON"
        activateBtn.TextColor3 = C.Success
        activateBtn:SetAttribute("on", true)
        activateBtn.BackgroundColor3 = C.ButtonOn
    else
        getgenv().ZABr0om_Net.Active = false
        activateBtn.Text = "⚡ Activate Parts: OFF"
        activateBtn.TextColor3 = C.Text
        activateBtn:SetAttribute("on", false)
        activateBtn.BackgroundColor3 = C.Button
        clearAllParts()
    end
end)

makeSection("👁️ ESP / VIEW")

local espBtn = makeBtn("👁️ ESP Player: OFF", function()
    espEnabled = not espEnabled
    if espEnabled then
        espBtn.Text = "👁️ ESP Player: ON"
        espBtn.TextColor3 = Color3.fromRGB(255, 80, 200)
        espBtn:SetAttribute("on", true)
        espBtn.BackgroundColor3 = C.ButtonOn
        for _, p in ipairs(Players:GetPlayers()) do
            createESP(p)
        end
    else
        espBtn.Text = "👁️ ESP Player: OFF"
        espBtn.TextColor3 = C.Text
        espBtn:SetAttribute("on", false)
        espBtn.BackgroundColor3 = C.Button
        for _, p in ipairs(Players:GetPlayers()) do
            removeESP(p)
        end
    end
end)

local viewBtn = makeBtn("👁️ View Target: OFF", function()
    viewActive = not viewActive
    if viewActive and targetPlayer then
        local hum = targetPlayer.Character and targetPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            workspace.CurrentCamera.CameraSubject = hum
            viewBtn.Text = "👁️ View Target: ON"
            viewBtn.TextColor3 = Color3.fromRGB(80, 200, 255)
            viewBtn:SetAttribute("on", true)
            viewBtn.BackgroundColor3 = C.ButtonOn
        end
    else
        viewActive = false
        local myHum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if myHum then
            workspace.CurrentCamera.CameraSubject = myHum
        end
        viewBtn.Text = "👁️ View Target: OFF"
        viewBtn.TextColor3 = C.Text
        viewBtn:SetAttribute("on", false)
        viewBtn.BackgroundColor3 = C.Button
    end
end)

makeSection("💀 DESTRUCTIVE")

local fireBtn = makeBtn("🔥 Fire Self: OFF", function()
    local char = LP.Character
    if not char then return end
    if not char:FindFirstChild("ZAB_Fire") then
        local folder = Instance.new("Folder", char)
        folder.Name = "ZAB_Fire"
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                local f = Instance.new("Fire")
                f.Size = 15
                f.Parent = p
            end
        end
        fireBtn.Text = "🔥 Fire Self: ON"
        fireBtn.TextColor3 = Color3.fromRGB(255, 150, 80)
        fireBtn:SetAttribute("on", true)
        fireBtn.BackgroundColor3 = C.ButtonOn
    else
        char.ZAB_Fire:Destroy()
        fireBtn.Text = "🔥 Fire Self: OFF"
        fireBtn.TextColor3 = C.Text
        fireBtn:SetAttribute("on", false)
        fireBtn.BackgroundColor3 = C.Button
    end
end)

local flyBtn = makeBtn("🦅 Fly: OFF", function()
    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    
    if not hrp:FindFirstChild("ZAB_FlyBV") then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "ZAB_FlyBV"
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        local bg = Instance.new("BodyGyro", hrp)
        bg.Name = "ZAB_FlyBG"
        bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        bg.P = 10000
        hum.PlatformStand = true
        flyBtn.Text = "🦅 Fly: ON"
        flyBtn.TextColor3 = Color3.fromRGB(80, 255, 200)
        flyBtn:SetAttribute("on", true)
        flyBtn.BackgroundColor3 = C.ButtonOn
    else
        hrp.ZAB_FlyBV:Destroy()
        local bg = hrp:FindFirstChild("ZAB_FlyBG")
        if bg then bg:Destroy() end
        hum.PlatformStand = false
        flyBtn.Text = "🦅 Fly: OFF"
        flyBtn.TextColor3 = C.Text
        flyBtn:SetAttribute("on", false)
        flyBtn.BackgroundColor3 = C.Button
    end
end)

local speedBtn = makeBtn("💨 Speed 100: OFF", function()
    local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if hum.WalkSpeed == 16 then
        hum.WalkSpeed = 100
        speedBtn.Text = "💨 Speed 100: ON"
        speedBtn.TextColor3 = Color3.fromRGB(255, 255, 100)
        speedBtn:SetAttribute("on", true)
        speedBtn.BackgroundColor3 = C.ButtonOn
    else
        hum.WalkSpeed = 16
        speedBtn.Text = "💨 Speed 100: OFF"
        speedBtn.TextColor3 = C.Text
        speedBtn:SetAttribute("on", false)
        speedBtn.BackgroundColor3 = C.Button
    end
end)

makeSection("🛑 RESET")

local resetBtn = makeBtn("🛑 STOP SEMUA", function()
    pirateMode = false
    orbitMode = false
    espEnabled = false
    viewActive = false
    flingActive = false
    autoPirateMode = false
    targetPlayer = nil
    targetBox.Text = ""
    clearAllParts()
    stopFling()
    stopSpin()
    for _, p in ipairs(Players:GetPlayers()) do
        removeESP(p)
    end
    notify("🛑", "Stop semua")
end)

local Footer = Instance.new("TextLabel", Content)
Footer.Size = UDim2.new(1, 0, 0, 20)
Footer.BackgroundTransparency = 1
Footer.Text = ">> by ZBN|ZAB v4 <<"
Footer.TextColor3 = C.TextDim
Footer.Font = Enum.Font.GothamBlack
Footer.TextSize = 9

-- Minimize
local isMin = false
local origSize = Panel.Size
MinBtn.MouseButton1Click:Connect(function()
    isMin = not isMin
    local tgt = isMin and UDim2.new(0, 280, 0, 40) or origSize
    MinBtn.Text = isMin and "+" or "−"
    TweenService:Create(Panel, TweenInfo.new(0.25), {Size = tgt}):Play()
    if isMin then
        Content.Visible = false
    else
        task.delay(0.2, function() Content.Visible = true end)
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    stopFling()
    stopSpin()
    clearAllParts()
    for _, p in ipairs(Players:GetPlayers()) do
        removeESP(p)
    end
    pcall(function() UI:Destroy() end)
end)

-- Drag
local dragging, dragStart, startPos
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Panel.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - dragStart
        Panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- ============ RAINBOW LOOP ============
task.spawn(function()
    local hue = 0
    while UI.Parent do
        local t = tick()
        hue = (hue + 0.005) % 1
        
        -- Update semua stroke jadi rainbow
        for i, s in ipairs(allStrokes) do
            if s and s.Parent then
                s.Color = rainbowColor(t, i * 0.5)
            end
        end
        
        -- Panel stroke cycling
        PanelStrokeGrad.Offset = Vector2.new(hue, 0)
        
        -- Header gradient cycling
        HeaderGrad.Offset = Vector2.new(hue, 0)
        
        task.wait(0.05)
    end
end)

-- ============ MAIN LOOPS ============
table.insert(getgenv().ZABr0omV4, RunService.RenderStepped:Connect(function(dt)
    if not orbitMode then return end
    local myRoot = getRoot(LP)
    if not myRoot then return end
    local parts = getgenv().ZABr0om_Net.Parts
    local count = #parts
    if count == 0 then return end
    orbitAngle = orbitAngle + dt * orbitSpeed
    for i = count, 1, -1 do
        local part = parts[i]
        if not part or not part.Parent then
            table.remove(parts, i)
        else
            local align = part:FindFirstChild("ZB_Align")
            if align and align.Enabled then align.Enabled = false end
            local ang = orbitAngle + (i * (math.pi * 2 / math.max(count, 1)))
            local targetPos = myRoot.Position + Vector3.new(
                math.cos(ang) * orbitRadius,
                orbitHeight,
                math.sin(ang) * orbitRadius
            )
            part.Velocity = (targetPos - part.Position) * 8
        end
    end
end))

table.insert(getgenv().ZABr0omV4, RunService.Heartbeat:Connect(function(dt)
    if not getgenv().ZABr0om_Net.Active then return end
    scanAccum = scanAccum + dt
    if scanAccum >= 1 then
        scanAccum = 0
        task.spawn(function()
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj.Anchored then
                    Manipulate(obj)
                end
            end
        end)
    end
end))

table.insert(getgenv().ZABr0omV4, RunService.RenderStepped:Connect(function()
    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local bv = hrp:FindFirstChild("ZAB_FlyBV")
    local bg = hrp:FindFirstChild("ZAB_FlyBG")
    if not bv or not bg then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local cam = workspace.CurrentCamera
    local v = hum.MoveDirection * 100
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then v = v + Vector3.new(0, 80, 0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then v = v - Vector3.new(0, 80, 0) end
    bv.Velocity = v
    bg.CFrame = cam.CFrame
end))

table.insert(getgenv().ZABr0omV4, RunService.Heartbeat:Connect(function()
    if espEnabled then updateESPDistance() end
end))

Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if espEnabled then createESP(p) end
    end)
end)

Players.PlayerRemoving:Connect(function(p)
    if espEnabled then removeESP(p) end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Q then
        if flingActive then stopFling() else if targetPlayer then startFling() end end
    end
end)

Panel.Size = UDim2.new(0, 0, 0, 0)
Panel.BackgroundTransparency = 1
TweenService:Create(Panel, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = origSize,
    BackgroundTransparency = 0
}):Play()

notify("🏴‍☠️ ZABr0om v4", "Loaded! ✅ Rainbow Mode")
print("════════════════════════════════════════")
print("  🔐 PASSWORD ACCEPTED")
print("  🏴‍☠️ ZABr0om PIRATE v4")
print("  🌈 Rainbow Theme")
print("  by ZBN|ZAB")
print("════════════════════════════════════════")
