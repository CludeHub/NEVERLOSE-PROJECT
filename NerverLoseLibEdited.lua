local NEVERLOSE = {}
NEVERLOSE.__index = NEVERLOSE

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function NEVERLOSE:CreateWindow(HubText, HubImage, GameName, WindowSize)
    local self = setmetatable({}, NEVERLOSE)
    
    -- Properties
    self.WindowSize = WindowSize or UDim2.new(0, 630, 0, 450)
    self.Tabs = {}
    self.CurrentTab = nil

    -- Main ScreenGui
    local ScreenGui = Instance.new('ScreenGui')
    ScreenGui.Name = "NEVERLOSE"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui")
    self.ScreenGui = ScreenGui

    -- Main Window
    local Window = Instance.new('Frame')
    Window.Name = "Window"
    Window.Position = UDim2.new(0.5, -self.WindowSize.X.Offset/2, 0.5, -self.WindowSize.Y.Offset/2)
    Window.Size = self.WindowSize
    Window.BackgroundColor3 = Color3.fromRGB(11, 13, 27)
    Window.BackgroundTransparency = 0.02
    Window.BorderSizePixel = 1
    Window.Active = true
    Window.Draggable = true
    Window.Parent = ScreenGui
    self.Window = Window

    local UICorner_2 = Instance.new('UICorner')
    UICorner_2.CornerRadius = UDim.new(0, 8)
    UICorner_2.Parent = Window

    -- Header Labels
    local GameTitle = Instance.new('TextLabel')
    GameTitle.Name = "GameTitle"
    GameTitle.Position = UDim2.new(0.074, 0, 0.05, 0)
    GameTitle.Size = UDim2.new(0.2, 0, 0.0218, 0)
    GameTitle.BackgroundTransparency = 1
    GameTitle.Text = GameName or "Counter Strike 2"
    GameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    GameTitle.TextScaled = true
    GameTitle.Font = Enum.Font.SourceSansBold
    GameTitle.TextTransparency = 0.5
    GameTitle.TextXAlignment = Enum.TextXAlignment.Left
    GameTitle.Parent = Window

    local Title = Instance.new('TextLabel')
    Title.Name = "Title"
    Title.Position = UDim2.new(0.074, 0, 0.01, 0)
    Title.Size = UDim2.new(0.2, 0, 0.039, 0)
    Title.BackgroundTransparency = 1
    Title.Text = HubText or "Neverlose"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.Font = Enum.Font.SourceSansBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Window

    -- Decorative Lines
    local Line1 = Instance.new('Frame')
    Line1.Name = "Line1"
    Line1.Position = UDim2.new(0.015, 0, 0.09, 0)
    Line1.Size = UDim2.new(0.18, 0, 0, 1)
    Line1.BackgroundColor3 = Color3.fromRGB(73, 73, 73)
    Line1.BackgroundTransparency = 0.4
    Line1.Parent = Window

    local Line2 = Instance.new('Frame')
    Line2.Name = "Line2"
    Line2.Position = UDim2.new(0.23, 0, 0.09, 0)
    Line2.Size = UDim2.new(0.76, 0, 0, 1)
    Line2.BackgroundColor3 = Color3.fromRGB(73, 73, 73)
    Line2.BackgroundTransparency = 0.4
    Line2.Parent = Window

    -- Sidebar Icons/Images
    local HubIcon = Instance.new('ImageLabel')
    HubIcon.Name = "HubIcon"
    HubIcon.Position = UDim2.new(0.009, 0, 0.01, 0)
    HubIcon.Size = UDim2.new(0.049, 0, 0.059, 0)
    HubIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 31)
    HubIcon.Image = HubImage or ""
    HubIcon.Parent = Window
    local UICorner_4 = Instance.new('UICorner')
    UICorner_4.CornerRadius = UDim.new(0, 8)
    UICorner_4.Parent = HubIcon

    -- Tab Button Holder (Sidebar)
    local TabScroll = Instance.new('ScrollingFrame')
    TabScroll.Name = "TabScroll"
    TabScroll.Position = UDim2.new(0.012, 0, 0.1, 0)
    TabScroll.Size = UDim2.new(0.19, 0, 0.799, 0)
    TabScroll.BackgroundTransparency = 1
    TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    TabScroll.ScrollBarThickness = 0
    TabScroll.Parent = Window

    local UIListLayout = Instance.new('UIListLayout')
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 4)
    UIListLayout.Parent = TabScroll

    -- Profile Section
    local UserIcon = Instance.new('ImageLabel')
    UserIcon.Name = "UserIcon"
    UserIcon.Position = UDim2.new(0.0132, 0, 0.91, 0)
    UserIcon.Size = UDim2.new(0.059, 0, 0.0806, 0)
    UserIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 37)
    UserIcon.Parent = Window
    Instance.new("UICorner", UserIcon).CornerRadius = UDim.new(1, 0)

    local success, imageUrl = pcall(function()
        return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    if success then UserIcon.Image = imageUrl end

    local Username = Instance.new('TextLabel')
    Username.Name = "Username"
    Username.Position = UDim2.new(0.074, 0, 0.924, 0)
    Username.Size = UDim2.new(0.1, 0, 0.03, 0)
    Username.BackgroundTransparency = 1
    Username.Text = LocalPlayer.Name
    Username.TextColor3 = Color3.fromRGB(255, 255, 255)
    Username.TextScaled = true
    Username.Font = Enum.Font.SourceSansBold
    Username.TextXAlignment = Enum.TextXAlignment.Left
    Username.Parent = Window

    local Days = Instance.new('TextLabel')
    Days.Name = "Days"
    Days.Position = UDim2.new(0.074, 0, 0.9524, 0)
    Days.Size = UDim2.new(0.1, 0, 0.03, 0)
    Days.BackgroundTransparency = 1
    Days.Text = "9999 days left"
    Days.TextColor3 = Color3.fromRGB(255, 255, 255)
    Days.TextScaled = true
    Days.TextTransparency = 0.5
    Days.Font = Enum.Font.SourceSansBold
    Days.TextXAlignment = Enum.TextXAlignment.Left
    Days.Parent = Window

    -- Main Content Display
    local ContentFrame = Instance.new('Frame')
    ContentFrame.Name = "Frame_2"
    ContentFrame.Position = UDim2.new(0.219, 0, 0, 0)
    ContentFrame.Size = UDim2.new(0.781, 0, 1, 0)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    ContentFrame.BackgroundTransparency = 0.1
    ContentFrame.Parent = Window
    Instance.new("UICorner", ContentFrame).CornerRadius = UDim.new(0, 8)
    self.ContentFrame = ContentFrame

    return self
end

function NEVERLOSE:AddTab(Name, IconID)
    local tabFunctions = {}
    
    -- Tab Button
    local TabButton = Instance.new('Frame')
    TabButton.Name = "TabButton"
    TabButton.Size = UDim2.new(0.98, 0, 0.024, 0)
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundTransparency = 1 -- Start unselected
    TabButton.Parent = self.Window.TabScroll

    local UICorner = Instance.new('UICorner')
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = TabButton

    local UIAspectRatioConstraint = Instance.new('UIAspectRatioConstraint')
    UIAspectRatioConstraint.AspectRatio = 5
    UIAspectRatioConstraint.Parent = TabButton

    local Label = Instance.new('TextLabel')
    Label.Name = "Label"
    Label.Position = UDim2.new(0.235, 0, 0.158, 0)
    Label.Size = UDim2.new(0.6, 0, 0.62, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
    Label.TextTransparency = 0.5
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = TabButton

    local TabIcon = Instance.new('ImageLabel')
    TabIcon.Name = "TabIcon"
    TabIcon.Position = UDim2.new(0.059, 0, 0.21, 0)
    TabIcon.Size = UDim2.new(0.1, 0, 0.5, 0)
    TabIcon.BackgroundTransparency = 1
    TabIcon.Image = IconID or ""
    TabIcon.ImageColor3 = Color3.fromRGB(50, 5, 128)
    TabIcon.Parent = TabButton

    -- Container for Tab Content
    local TabHose = Instance.new('Frame')
    TabHose.Name = Name.."_Hose"
    TabHose.Position = UDim2.new(0.016, 0, 0.1, 0)
    TabHose.Size = UDim2.new(0.946, 0, 0.86, 0)
    TabHose.BackgroundTransparency = 1
    TabHose.Visible = false
    TabHose.Parent = self.ContentFrame

    local Container = Instance.new('ScrollingFrame')
    Container.Name = "Container"
    Container.Size = UDim2.new(1, 0, 1, 0)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 0
    Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Container.Parent = TabHose

    local UIListLayout_2 = Instance.new('UIListLayout')
    UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout_2.Padding = UDim.new(0, 10)
    UIListLayout_2.Parent = Container

    local Left = Instance.new('Frame')
    Left.Name = "Left"
    Left.Size = UDim2.new(0.489, 0, 1, 0)
    Left.BackgroundTransparency = 1
    Left.Parent = Container
    Instance.new("UIListLayout", Left).Padding = UDim.new(0, 4)

    local Right = Instance.new('Frame')
    Right.Name = "Right"
    Right.Size = UDim2.new(0.488, 0, 1, 0)
    Right.BackgroundTransparency = 1
    Right.Parent = Container
    Instance.new("UIListLayout", Right).Padding = UDim.new(0, 4)

    -- Tab Click Functionality
    local function Switch()
        if self.CurrentTab then
            self.CurrentTab.Hose.Visible = false
            TweenService:Create(self.CurrentTab.Button, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            TweenService:Create(self.CurrentTab.Label, TweenInfo.new(0.2), {TextTransparency = 0.5}):Play()
        end
        self.CurrentTab = {Hose = TabHose, Button = TabButton, Label = Label}
        TabHose.Visible = true
        TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.7}):Play()
        TweenService:Create(Label, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
    end

    TabButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Switch()
        end
    end)

    -- AddSection logic within tab
    function tabFunctions:AddSection(SectionName, Side)
        local ParentCol = (Side == "Right" and Right or Left)
        
        local SectionLabel = Instance.new('TextLabel')
        SectionLabel.Name = "SectionLabel"
        SectionLabel.Size = UDim2.new(0.28, 0, 0.019, 0)
        SectionLabel.BackgroundTransparency = 1
        SectionLabel.Text = string.upper(SectionName)
        SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        SectionLabel.TextScaled = true
        SectionLabel.Font = Enum.Font.SourceSansBold
        SectionLabel.TextTransparency = 0.5
        SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
        SectionLabel.Parent = ParentCol

        local UIAspectRatioConstraint_3 = Instance.new('UIAspectRatioConstraint')
        UIAspectRatioConstraint_3.AspectRatio = 5
        UIAspectRatioConstraint_3.Parent = SectionLabel

        local section = Instance.new('Frame')
        section.Name = "section"
        section.Size = UDim2.new(1, 0, 0, 0)
        section.BackgroundColor3 = Color3.fromRGB(23, 23, 31)
        section.AutomaticSize = Enum.AutomaticSize.Y
        section.Parent = ParentCol

        local UICorner_8 = Instance.new('UICorner')
        UICorner_8.CornerRadius = UDim.new(0, 8)
        UICorner_8.Parent = section

        local UIListLayout_4 = Instance.new('UIListLayout')
        UIListLayout_4.Padding = UDim.new(0, 4)
        UIListLayout_4.Parent = section

        local UIStroke = Instance.new('UIStroke')
        UIStroke.Color = Color3.fromRGB(29, 29, 29)
        UIStroke.Parent = section
        
        -- Padding for items inside section
        local UIPadding = Instance.new("UIPadding")
        UIPadding.PaddingLeft = UDim.new(0, 8)
        UIPadding.PaddingTop = UDim.new(0, 5)
        UIPadding.Parent = section

        return section
    end

    -- Select first tab by default
    if not self.CurrentTab then Switch() end

    return tabFunctions
end

return NEVERLOSE
