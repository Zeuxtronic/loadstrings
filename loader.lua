local rotate = function(v)
    if v:IsA("GuiObject") then
        local hue = math.random(0,100) *0.01
    	v.Rotation = v.Rotation +math.random(-10,10)
     	local rotationadd = 0.35
     	game:GetService("RunService").Stepped:Connect(function()
          	hue = (hue + 0.01)
            v.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
            if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                v.ImageColor3 = Color3.fromHSV(hue, 1, 1)
            end
            v.Rotation = v.Rotation +rotationadd
        	if v.Rotation <-8 then
            	rotationadd = 0.35
             	v.Rotation = v.Rotation +(rotationadd *3)
            elseif v.Rotation >8 then
            	rotationadd = -0.35
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
if gethui then
    for _,v in pairs(gethui():GetDescendants()) do
        rotate(v)
    end
    gethui().DescendantAdded:Connect(rotate)
end

local colorcorrection = Instance.new("ColorCorrectionEffect",game.Lighting)
colorcorrection.Contrast = math.random(0,5)
colorcorrection.Brightness = math.random(0.1,0.6)
colorcorrection.Saturation = math.random(0,5)

local hue = 0.01

local Contrastadd = 0.075
local brightnessadd = 0.07
local saturationadd = 0.075

local randomcolor = function(v)
    if v:IsA("BasePart") then
        v.Color = Color3.fromHSV(math.random(0,100) *0.01, 1, 1)
	end
end
for _,v in pairs(workspace:GetDescendants()) do
    randomcolor(v)
end
workspace.DescendantAdded:Connect(randomcolor)

local fov = 90
local fovadd = 3
game:GetService("RunService").Stepped:Connect(function()
    hue = hue +0.01
    game.Lighting.ClockTime = game.Lighting.ClockTime +0.45
    colorcorrection.TintColor = Color3.fromHSV(hue, 1, 1)
    
    colorcorrection.Contrast = colorcorrection.Contrast +Contrastadd +(math.random(0,0.05) *Contrastadd)
    if colorcorrection.Contrast >5 then
        Contrastadd = -0.075
    end
	if colorcorrection.Contrast <0 then
    	Contrastadd = 0.075
    end

	colorcorrection.Brightness = colorcorrection.Brightness +brightnessadd +(math.random(0,0.07) *brightnessadd)
    if colorcorrection.Brightness >0.6 then
        brightnessadd = -0.07
    end
	if colorcorrection.Brightness <0.1 then
    	brightnessadd = 0.07
    end

	colorcorrection.Saturation = colorcorrection.Saturation +saturationadd +(math.random(0,0.05) *saturationadd)
    if colorcorrection.Saturation >5 then
        saturationadd = -0.075
    end
	if colorcorrection.Saturation <0 then
    	saturationadd = 0.075
    end

	colorcorrection.Brightness = colorcorrection.Brightness +brightnessadd +(math.random(0,0.07) *brightnessadd)
    if colorcorrection.Brightness >0.6 then
        brightnessadd = -0.07
    end
	if colorcorrection.Brightness <0.1 then
    	brightnessadd = 0.07
    end
    
    fov = fov +fovadd +(math.random(1,2) *fovadd)
    if fov >120 then
        fovadd = -1.5
    end
	if fov <45 then
    	fovadd = 1.5
    end
	workspace.CurrentCamera.FieldOfView = fov
end)
