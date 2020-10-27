local function IsAlive()
  local Value = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGUI"):WaitForChild("Game"):WaitForChild("CashBag").Visible

  if Value then return true else if not Value then return false end end

end

repeat 
  wait()
until IsAlive()

syn.queue_on_teleport("wait(10) loadstring(game:HttpGet('https://raw.githubusercontent.com/bonefraktur/Scripts/main/%3F.lua'))()")
wait(180)
game:GetService("TeleportService"):Teleport(game.PlaceId)
