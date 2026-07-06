-- Apple Hub v7.6: Part 1 (Layout Core Panel)
local P, UIS = game:GetService("Players"), game:GetService("UserInputService")
local LPlr, TargetGui = P.LocalPlayer, P.LocalPlayer:WaitForChild("PlayerGui", 10) or game:GetService("CoreGui")
_G.AppleHub = {WS = 16, JP = 50, GRV = 196.2, FS = 50, F = false, N = false, C = false, E = false, InfJ = false}
local ESPF = Instance.new("Folder", TargetGui) ESPF.Name = "AppleESP_Storage" _G.AppleHub.ESPF = ESPF
local SG = Instance.new("ScreenGui", TargetGui) SG.Name = "AppleHub" SG.ResetOnSpawn = false
local Theme = {Bg = Color3.fromRGB(16,16,18), Ac = Color3.fromRGB(255,45,85), Cd = Color3.fromRGB(24,24,28), Tx = Color3.fromRGB(245,245,247), Mt = Color3.fromRGB(100,100,105), Sc = Color3.fromRGB(52,199,89)} _G.AppleHub.Theme = Theme
local MF = Instance.new("Frame", SG) MF.Size = UDim2.new(0, 310, 0, 320) MF.Position = UDim2.new(0.5, -155, 0.5, -160) MF.BackgroundColor3 = Theme.Bg MF.Active = true Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 12)
local HD = Instance.new("Frame", MF) HD.Size = UDim2.new(1, 0, 0, 40) HD.BackgroundColor3 = Theme.Cd Instance.new("UICorner", HD).CornerRadius = UDim.new(0, 12)
local TL = Instance.new("TextLabel", HD) TL.Size = UDim2.new(0.5, 0, 1, 0) TL.Position = UDim2.new(0, 12, 0, 0) TL.BackgroundTransparency = 1 TL.Text = "Apple Hub" TL.TextColor3 = Theme.Tx TL.TextSize = 16 TL.Font = Enum.Font.SourceSansBold TL.TextXAlignment = Enum.TextXAlignment.Left
local MB = Instance.new("ImageButton", HD) MB.Size = UDim2.new(0, 22, 0, 22) MB.Position = UDim2.new(1, -32, 0.5, -11) MB.BackgroundTransparency = 1 MB.Image = "rbxassetid://10636402384" MB.ImageColor3 = Theme.Tx
local TabBar = Instance.new("Frame", MF) TabBar.Size = UDim2.new(1, -20, 0, 26) TabBar.Position = UDim2.new(0, 10, 0, 48) TabBar.BackgroundTransparency = 1
local TabM = Instance.new("TextButton", TabBar) TabM.Size = UDim2.new(0.5, -2, 1, 0) TabM.BackgroundColor3 = Theme.Cd TabM.Text = "Movement" TabM.TextColor3 = Theme.Ac TabM.TextSize = 12 TabM.Font = Enum.Font.SourceSansBold Instance.new("UICorner", TabM).CornerRadius = UDim.new(0, 6)
local TabU = Instance.new("TextButton", TabBar) TabU.Size = UDim2.new(0.5, -2, 1, 0) TabU.Position = UDim2.new(0.5, 2, 0, 0) TabU.BackgroundColor3 = Theme.Bg TabU.Text = "Utilities" TabU.TextColor3 = Theme.Mt TabU.TextSize = 12 TabU.Font = Enum.Font.SourceSansBold Instance.new("UICorner", TabU).CornerRadius = UDim.new(0, 6)
local MovePage = Instance.new("ScrollingFrame", MF) MovePage.Size = UDim2.new(1, -20, 1, -85) MovePage.Position = UDim2.new(0, 10, 0, 80) MovePage.BackgroundTransparency = 1 MovePage.BorderSizePixel = 0 MovePage.ScrollBarThickness = 2 _G.AppleHub.MovePage = MovePage
local UtilPage = Instance.new("ScrollingFrame", MF) UtilPage.Size = UDim2.new(1, -20, 1, -85) UtilPage.Position = UDim2.new(0, 10, 0, 80) UtilPage.BackgroundTransparency = 1 UtilPage.BorderSizePixel = 0 UtilPage.ScrollBarThickness = 2 UtilPage.Visible = false _G.AppleHub.UtilPage = UtilPage
local LM = Instance.new("UIListLayout", MovePage) LM.Padding = UDim.new(0, 5) LM:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() MovePage.CanvasSize = UDim2.new(0,0,0,LM.AbsoluteContentSize.Y+5) end)
local LU = Instance.new("UIListLayout", UtilPage) LU.Padding = UDim.new(0, 5) LU:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() UtilPage.CanvasSize = UDim2.new(0,0,0,LU.AbsoluteContentSize.Y+5) end)
TabM.MouseButton1Click:Connect(function() TabM.BackgroundColor3 = Theme.Cd TabM.TextColor3 = Theme.Ac TabU.BackgroundColor3 = Theme.Bg TabU.TextColor3 = Theme.Mt MovePage.Visible = true UtilPage.Visible = false end)
TabU.MouseButton1Click:Connect(function() TabU.BackgroundColor3 = Theme.Cd TabU.TextColor3 = Theme.Ac TabM.BackgroundColor3 = Theme.Bg TabM.TextColor3 = Theme.Mt UtilPage.Visible = true MovePage.Visible = false end)
local drag, dInp, dStart, sPos
HD.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag = true dStart = i.Position sPos = MF.Position i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then drag = false end end) end end)
HD.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then dInp = i end end)
UIS.InputChanged:Connect(function(i) if i == dInp and drag then local d = i.Position - dStart MF.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + d.X, sPos.Y.Scale, sPos.Y.Offset + d.Y) end end)
local IsCol, OrigH = false, MF.Size.Y.Offset
MB.MouseButton1Click:Connect(function() IsCol = not IsCol if IsCol then OrigH = MF.Size.Y.Offset MovePage.Visible = false UtilPage.Visible = false TabBar.Visible = false MB.Image = "rbxassetid://13404554341" MB.ImageColor3 = Theme.Ac MF:TweenSize(UDim2.new(0, MF.Size.X.Offset, 0, 40), "Out", "Quad", 0.2, true) else MF:TweenSize(UDim2.new(0, MF.Size.X.Offset, 0, OrigH), "Out", "Quad", 0.2, true, function() TabBar.Visible = true if TabM.TextColor3 == Theme.Ac then MovePage.Visible = true else UtilPage.Visible = true end end) MB.Image = "rbxassetid://10636402384" MB.ImageColor3 = Theme.Tx end end)
-- Apple Hub v7.6: Part 2 (Hacks & Mechanics Core)
local P, RS, UIS = game:GetService("Players"), game:GetService("RunService"), game:GetService("UserInputService")
local LPlr, Mouse, Camera = P.LocalPlayer, P.LocalPlayer:GetMouse(), workspace.CurrentCamera
local HData, Theme = _G.AppleHub, _G.AppleHub.Theme
local MovePage, UtilPage, ESPF = HData.MovePage, HData.UtilPage, HData.ESPF
local FlyCon, NocCon, InfJCon
local TargetGui = LPlr:WaitForChild("PlayerGui", 10) or game:GetService("CoreGui")
local FGui = Instance.new("ScreenGui", TargetGui) FGui.Name = "AppleFlightPad" FGui.ResetOnSpawn = false FGui.Enabled = false
local PF = Instance.new("Frame", FGui) PF.Size = UDim2.new(0, 65, 0, 130) PF.Position = UDim2.new(0.85, 0, 0.4, 0) PF.BackgroundColor3 = Theme.Bg PF.Active = true PF.Draggable = true Instance.new("UICorner", PF).CornerRadius = UDim.new(0, 10)
local function makePBtn(text, y) local b = Instance.new("TextButton", PF) b.Size = UDim2.new(1, -12, 0, 48) b.Position = UDim2.new(0, 6, 0, y) b.BackgroundColor3 = Color3.fromRGB(16,16,18) b.Text = text b.TextColor3 = Theme.Tx b.TextSize = 20 b.Font = Enum.Font.SourceSansBold Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6) return b end
local bU, bD, mU, mD = makePBtn("▲", 8), makePBtn("▼", 68), false, false
bU.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then mU = true bU.BackgroundColor3 = Theme.Ac end end)
bU.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then mU = false bU.BackgroundColor3 = Color3.fromRGB(16,16,18) end end)
bD.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then mD = true bD.BackgroundColor3 = Theme.Ac end end)
bD.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then mD = false bD.BackgroundColor3 = Color3.fromRGB(16,16,18) end end)
local function addVal(page, txt, def, step, min, max, cb)
    local c = Instance.new("Frame", page) c.Size = UDim2.new(1, -4, 0, 36) c.BackgroundColor3 = Theme.Cd Instance.new("UICorner", c).CornerRadius = UDim.new(0, 6)
    local l = Instance.new("TextLabel", c) l.Size = UDim2.new(0.5, 0, 1, 0) l.Position = UDim2.new(0, 8, 0, 0) l.BackgroundTransparency = 1 l.Text = txt .. ": " .. def l.TextColor3 = Theme.Tx l.TextSize = 12 l.Font = Enum.Font.SourceSansSemibold l.TextXAlignment = Enum.TextXAlignment.Left
    local cur = def local function adjust(amt) cur = math.clamp(cur + amt, min, max) l.Text = txt .. ": " .. cur cb(cur) end
    local bA = Instance.new("TextButton", c) bA.Size = UDim2.new(0, 24, 0, 22) bA.Position = UDim2.new(1, -30, 0.5, -11) bA.BackgroundColor3 = Theme.Bg bA.Text = "+" bA.TextColor3 = Theme.Ac Instance.new("UICorner", bA).CornerRadius = UDim.new(0, 4)
    local bS = Instance.new("TextButton", c) bS.Size = UDim2.new(0, 24, 0, 22) bS.Position = UDim2.new(1, -58, 0.5, -11) bS.BackgroundColor3 = Theme.Bg bS.Text = "-" bS.TextColor3 = Theme.Tx Instance.new("UICorner", bS).CornerRadius = UDim.new(0, 4)
    bA.MouseButton1Click:Connect(function() adjust(step) end) bS.MouseButton1Click:Connect(function() adjust(-step) end)
end
local function addTog(page, txt, cb)
    local c = Instance.new("Frame", page) c.Size = UDim2.new(1, -4, 0, 36) c.BackgroundColor3 = Theme.Cd Instance.new("UICorner", c).CornerRadius = UDim.new(0, 6)
    local l = Instance.new("TextLabel", c) l.Size = UDim2.new(0.6, 0, 1, 0) l.Position = UDim2.new(0, 8, 0, 0) l.BackgroundTransparency = 1 l.Text = txt l.TextColor3 = Theme.Tx l.TextSize = 12 l.Font = Enum.Font.SourceSansSemibold l.TextXAlignment = Enum.TextXAlignment.Left
    local s = Instance.new("TextButton", c) s.Size = UDim2.new(0, 36, 0, 18) s.Position = UDim2.new(1, -44, 0.5, -9) s.BackgroundColor3 = Theme.Bg s.Text = "" Instance.new("UICorner", s).CornerRadius = UDim.new(1, 0)
    local d = Instance.new("Frame", s) d.Size = UDim2.new(0, 12, 0, 12) d.Position = UDim2.new(0, 3, 0.5, -6) d.BackgroundColor3 = Theme.Mt Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
    local act = false s.MouseButton1Click:Connect(function() act = not act if act then s.BackgroundColor3 = Theme.Sc d.Position = UDim2.new(1, -15, 0.5, -6) d.BackgroundColor3 = Theme.Tx else s.BackgroundColor3 = Theme.Bg d.Position = UDim2.new(0, 3, 0.5, -6) d.BackgroundColor3 = Theme.Mt end cb(act) end)
end
addVal(MovePage, "Walk Speed", 16, 5, 16, 500, function(v) HData.WS = v if LPlr.Character and LPlr.Character:FindFirstChild("Humanoid") then LPlr.Character.Humanoid.WalkSpeed = v end end)
addVal(MovePage, "Jump Power", 50, 10, 0, 600, function(v) HData.JP = v if LPlr.Character and LPlr.Character:FindFirstChild("Humanoid") then LPlr.Character.Humanoid.JumpPower = v end end)
addVal(MovePage, "World Gravity", 196, 20, 0, 1000, function(v) HData.GRV = v workspace.Gravity = v end)
addVal(MovePage, "Fly Velocity", 50, 5, 10, 300, function(v) HData.FS = v end)
addTog(MovePage, "Infinite Jump Switch", function(t) HData.InfJ = t if t then InfJCon = UIS.JumpRequest:Connect(function() if HData.InfJ and LPlr.Character and LPlr.Character:FindFirstChildOfClass("Humanoid") then LPlr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end end) else if InfJCon then InfJCon:Disconnect() end end end)
addTog(MovePage, "Aviation System (Fly)", function(t) HData.F = t
    if t then
        local bg = Instance.new("BodyGyro", LPlr.Character:WaitForChild("HumanoidRootPart")) bg.P = 9000 bg.maxTorque = Vector3.new(9000,9000,9000) bg.cframe = LPlr.Character.HumanoidRootPart.CFrame
        local bv = Instance.new("BodyVelocity", LPlr.Character.HumanoidRootPart) bv.velocity = Vector3.new(0,0,0) bv.maxForce = Vector3.new(9000,9000,9000)
        FlyCon = RS.RenderStepped:Connect(function() if not HData.F or not Camera then return end
            local moveDir = Vector3.new(0,0,0) local joyDir = LPlr.Character and LPlr.Character:FindFirstChild("Humanoid") and LPlr.Character.Humanoid.MoveDirection or Vector3.new(0,0,0)
            if joyDir.Magnitude > 0 then moveDir = joyDir * HData.FS end
            local vert = 0 if mU or UIS:IsKeyDown(Enum.KeyCode.Space) then vert = HData.FS end if mD or UIS:IsKeyDown(Enum.KeyCode.LeftShift) then vert = -HData.FS end
            bv.velocity = Vector3.new(moveDir.X, vert == 0 and bv.velocity.Y * 0.7 or vert, moveDir.Z) bg.cframe = Camera.CFrame
        end)
    else if FlyCon then FlyCon:Disconnect() end if LPlr.Character and LPlr.Character:FindFirstChild("HumanoidRootPart") then local g,v = LPlr.Character.HumanoidRootPart:FindFirstChild("BodyGyro"), LPlr.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") if g then g:Destroy() end if v then v:Destroy() end end end
end)
addTog(UtilPage, "Phase Matrix (Noclip)", function(t) HData.N = t if t then NocCon = RS.Stepped:Connect(function() if not HData.N then return end if LPlr.Character then for _, v in pairs(LPlr.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end) else if NocCon then NocCon:Disconnect() end end end)
addTog(UtilPage, "Click Teleport (Tap Screen)", function(t) HData.C = t end)
UIS.InputBegan:Connect(function(i, p) if not p and HData.C and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then local ray = Camera:ScreenPointToRay(i.Position.X, i.Position.Y) local res = workspace:Raycast(ray.Origin, ray.Direction * 1000) if res and LPlr.Character and LPlr.Character:FindFirstChild("HumanoidRootPart") then LPlr.Character.HumanoidRootPart.CFrame = CFrame.new(res.Position + Vector3.new(0,3,0)) end end end)
local function makeESP(plr) if plr == LPlr then return end local function draw() local char = plr.Character or plr.CharacterAdded:Wait() local hrp = char:WaitForChild("HumanoidRootPart", 5) if not hrp or ESPF:FindFirstChild(plr.Name) then return end local h = Instance.new("Highlight", ESPF) h.Name = plr.Name h.Adornee = char h.FillColor = Theme.Ac h.FillTransparency = 0.5 h.OutlineColor = Color3.new(1,1,1) end draw() plr.CharacterAdded:Connect(draw) end
addTog(UtilPage, "Biometric Tracker (ESP)", function(t) HData.E = t if t then for _, p in pairs(P:GetPlayers()) do makeESP(p) end _G.EspAdd = P.PlayerAdded:Connect(makeESP) else ESPF:ClearAllChildren() if _G.EspAdd then _G.EspAdd:Disconnect() end end end)
RS.RenderStepped:Connect(function() FGui.Enabled = HData.F end) LPlr.CharacterAdded:Connect(function(c) local h = c:WaitForChild("Humanoid", 5) if h then h.WalkSpeed = HData.WS h.JumpPower = HData.JP end end)
