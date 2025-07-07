local rotate = function(v)
    if v:IsA("GuiObject") then
        local hue = math.random(0,100) *0.01
    	v.Rotation = v.Rotation +math.random(-10,10)
     	local rotationadd = 0.25
     	game:GetService("RunService").Stepped:Connect(function()
          	hue = (hue + 0.01)
            v.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
            if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                v.ImageColor3 = Color3.fromHSV(hue, 1, 1)
            end
            v.Rotation = v.Rotation +rotationadd
        	if v.Rotation <-5 then
            	rotationadd = 0.25
             	v.Rotation = v.Rotation +(rotationadd *3)
            elseif v.Rotation >5 then
            	rotationadd = -0.25
             	v.Rotation = v.Rotation +(rotationadd *3)
            end
        end)
    end
end

for _,v in pairs(game.CoreGui:GetDescendants()) do
    rotate(v)
end
game.CoreGui.DescendantAdded:Connect(rotate)
for _,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
    rotate(v)
end
game.Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(rotate)
