local XameitzFrame = Instance.new("ScreenGui")
XameitzFrame.Name = "XameitzFrame"
XameitzFrame.Parent = game.CoreGui
XameitzFrame.ZIndexBehavior = Enum.ZIndexBehavior.Global

local Xameitz = {}
Xameitz.__index = Xameitz

function Xameitz.new()
    local instance = setmetatable({}, Xameitz)
    return instance
end

function Xameitz:Add(config)
    self.Name = config.Name or "nil"
    self.Image = config.Image or "nil"
    self.UiWidth = config.UiWidth or 200
end

function Xameitz:create(desc)
    if XameitzFrame:FindFirstChild("Frame") then
        XameitzFrame.Frame:Destroy()
    end

    local All = {
        ["Stroke"] = Color3.fromRGB(75, 0, 130),
        ["Background"] = Color3.fromRGB(30, 30, 30),
    }

    local Frame = Instance.new("Frame")
    local Image = Instance.new("ImageLabel")
    local Title = Instance.new("TextLabel")
    local Desc = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")

    Frame.Name = "Frame"
    Frame.Parent = XameitzFrame
    Frame.BackgroundColor3 = All["Background"]
    Frame.BackgroundTransparency = .1
    Frame.Size = UDim2.new(0, self.UiWidth, 0, 60)
    Frame.Position = UDim2.new(0.5, -self.UiWidth/2, 0, -60)
    Frame:TweenPosition(UDim2.new(0.5, -self.UiWidth/2, 0, 10), "Out", "Quad", 0.4, true)

    local stroke = Instance.new("UIStroke")
    stroke.Color = All["Stroke"]
    stroke.Thickness = 1
    stroke.Transparency = 0
    stroke.Parent = Frame

    Image.Name = "Icon"
    Image.Parent = Frame
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.000
    Image.Position = UDim2.new(0, 8, 0, 8)
    Image.Size = UDim2.new(0, 45, 0, 45)
    Image.Image = self.Image

    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0, 55, 0, 14)
    Title.Size = UDim2.new(0, self.UiWidth - 55, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = self.Name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Desc.Parent = Frame
    Desc.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    Desc.BackgroundTransparency = 1.000
    Desc.Position = UDim2.new(0, 55, 0, 33)
    Desc.Size = UDim2.new(0, self.UiWidth - 55, 0, 10)
    Desc.Font = Enum.Font.GothamSemibold
    Desc.TextTransparency = .3
    Desc.Text = desc
    Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
    Desc.TextSize = 12.000
    Desc.TextXAlignment = Enum.TextXAlignment.Left

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Frame

    self.Desc = Desc
end

function Xameitz:SetText(newDesc)
    if self.Desc then
        self.Desc.Text = newDesc
    end
end

return Xameitz
