local ToTween = game.Players.LocalPlayer.Character.HumanoidRootPart

local function TweenToCoin(Coin)
  game:GetService("TweenService"):Create(ToTween, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = Coin.CFrame}):Play()
end

_G.Searching = false

local function FakeHumanoid()
 if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
 local Hum = game.Players.LocalPlayer.Character.Humanoid:Clone()
 game.Players.LocalPlayer.Character.Humanoid:Destroy()
 Hum.Parent = game.Players.LocalPlayer.Character
 end
end

local function IsAlive()
  local Value = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGUI"):WaitForChild("Game"):WaitForChild("CashBag").Visible

  if Value then return true else if not Value then return false end end

end

local function LobbyCheck()
  local Value = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGUI"):WaitForChild("Game"):WaitForChild("Waiting").Visible
  
  if Value then return true else if not Value then return false end end

end

local function Start()
FakeHumanoid()

_G.Searching = true

local I, E = pcall(function()
for I, V in pairs(workspace:GetDescendants()) do
  if V:IsA("Model") then
    if V:FindFirstChild("CoinContainer") then
     for Index, Coin in pairs(V.CoinContainer:GetDescendants()) do
        if Coin.Name == "Coin_Server" then
          if Coin:FindFirstChild("Coin") then
            if Coin.Coin:FindFirstChild("Fire") then
            print('found fire candy! [ EPIC ]')
            TweenToCoin(Coin)
            wait(2)
            end
          end
        end
      end
    end
  end
end
end)

if I then 
  _G.Searching = false
if not I then
  _G.Searching = false
  end
end

end

game:GetService"RunService".Stepped:Connect(function()
  wait(180)
  syn.queue_on_teleport("wait(10) loadstring(game:HttpGet'link')")
  game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

while wait(2) do
 if not IsAlive() then 
     warn('waiting for the game to start.') 
 end
 if not _G.Searching and IsAlive() then
    warn('in-game, looking!')
    Start()
  end
end
