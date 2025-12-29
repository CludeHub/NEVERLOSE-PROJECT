local NEVERLOSE = {}
NEVERLOSE.__index = NEVERLOSE

local TweenService = game:GetService("TweenService")

function NEVERLOSE:AddWindow(HubText, HubImage, GameName, WindowSize)
    local self = setmetatable({}, NEVERLOSE)
    
    local Windowsize = WindowSize or UDim2.new(0, 630, 0, 450)
    self.CurrentTab = nil

    local PlayerGui = game.CoreGui
    local ScreenGui = Instance.new('ScreenGui')
    ScreenGui.Name = "NEVERLOSE"
    ScreenGui.Parent = PlayerGui
    self.Gui = ScreenGui

    local Window = Instance.new('Frame')
    Window.Name = "Window"
    Window.Position = UDim2.new(0.5, -Windowsize.X.Offset/2, 0.5, -Windowsize.Y.Offset/2)
    Window.Active = true
    Window.Draggable = true
    Window.Size = Windowsize
    Window.BackgroundColor3 = Color3.fromRGB(11, 13, 27)
    Window.BackgroundTransparency = 0.019999999552965164
    Window.BorderSizePixel = 1
    Window.Parent = ScreenGui
    self.MainWindow = Window

    -- [ORIGINAL GAME TITLE]
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

    -- [ORIGINAL LINES]
    local Line2 = Instance.new('Frame')
    Line2.Name = "Line2"
    Line2.Position = UDim2.new(0.23, 0, 0.09, 0)
    Line2.Size = UDim2.new(0.76, 0, 0, 1)
    Line2.BackgroundColor3 = Color3.fromRGB(73, 73, 73)
    Line2.BackgroundTransparency = 0.4
    Line2.Parent = Window

    local Line1 = Instance.new('Frame')
    Line1.Name = "Line1"
    Line1.Position = UDim2.new(0.015, 0, 0.09, 0)
    Line1.Size = UDim2.new(0.18, 0, 0, 1)
    Line1.BackgroundColor3 = Color3.fromRGB(73, 73, 73)
    Line1.BackgroundTransparency = 0.4
    Line1.Parent = Window

    -- [ORIGINAL USERNAME & PROFILE]
    local Username = Instance.new('TextLabel')
    Username.Name = "Username"
    Username.Position = UDim2.new(0.074, 0, 0.924, 0)
    Username.Size = UDim2.new(0.1, 0, 0.03, 0)
    Username.BackgroundTransparency = 1
    Username.Text = game:GetService("Players").LocalPlayer.Name
    Username.TextColor3 = Color3.fromRGB(255, 255, 255)
    Username.TextScaled = true
    Username.Font = Enum.Font.SourceSansBold
    Username.TextXAlignment = Enum.TextXAlignment.Left
    Username.Parent = Window

    -- [THE SETTINGS BUTTON YOU MENTIONED]
    local settings = Instance.new('TextButton')
    settings.Name = "settings"
    settings.Position = UDim2.new(0.15, 0, 0.928, 0)
    settings.Size = UDim2.new(0.1, 0, 0.049, 0)
    settings.BackgroundTransparency = 1
    settings.Text = ">"
    settings.TextColor3 = Color3.fromRGB(255, 255, 255)
    settings.TextScaled = true
    settings.Font = Enum.Font.SourceSansBold
    settings.Parent = Window

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

    local UserIcon = Instance.new('ImageLabel')
    UserIcon.Name = "UserIcon"
    UserIcon.Position = UDim2.new(0.0132, 0, 0.91, 0)
    UserIcon.Size = UDim2.new(0.059, 0, 0.0806, 0)
    UserIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 37)
    UserIcon.Parent = Window
    local UICorner_3 = Instance.new('UICorner')
    UICorner_3.CornerRadius = UDim.new(1, 0)
    UICorner_3.Parent = UserIcon

    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    pcall(function()
        UserIcon.Image = game:GetService("Players"):GetUserThumbnailAsync(game:GetService("Players").LocalPlayer.UserId, thumbType, thumbSize)
    end)

    local HubIcon = Instance.new('ImageLabel')
    HubIcon.Name = "HubIcon"
    HubIcon.Position = UDim2.new(0.009, 0, 0.01, 0)
    HubIcon.Size = UDim2.new(0.049, 0, 0.059, 0)
    HubIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 31)
    HubIcon.Image = HubImage
    HubIcon.Parent = Window
    local UICorner_4 = Instance.new('UICorner')
    UICorner_4.CornerRadius = UDim.new(0, 8)
    UICorner_4.Parent = HubIcon

    local search = Instance.new('ImageButton')
    search.Name = "search"
    search.Position = UDim2.new(0.949, 0, 0.02, 0)
    search.Size = UDim2.new(0.04, 0, 0.039, 0)
    search.BackgroundTransparency = 1
    search.Parent = Window

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

    -- [ORIGINAL FRAME 2 - CONTENT HOLDER]
    local Frame2 = Instance.new('Frame')
    Frame2.Name = "Frame_2"
    Frame2.Position = UDim2.new(0.219, 0, 0, 0)
    Frame2.Size = UDim2.new(0.781, 0, 1, 0)
    Frame2.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    Frame2.BackgroundTransparency = 0.1
    Frame2.Parent = Window
    self.ContentFrame = Frame2

    local UICorner_5 = Instance.new('UICorner')
    UICorner_5.CornerRadius = UDim.new(0, 8)
    UICorner_5.Parent = Frame2

    -- [TAB SIDEBAR]
    local TabList = Instance.new('ScrollingFrame')
    TabList.Name = "Tab"
    TabList.Position = UDim2.new(0.012, 0, 0.1, 0)
    TabList.Size = UDim2.new(0.19, 0, 0.799, 0)
    TabList.BackgroundTransparency = 1
    TabList.ScrollBarThickness = 0
    TabList.CanvasSize = UDim2.new(0,0,0,0)
    TabList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    TabList.Parent = Window
    self.TabList = TabList

    local UIListLayout = Instance.new('UIListLayout')
    UIListLayout.Padding = UDim.new(0, 4)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = TabList

    local UICorner_Window = Instance.new('UICorner')
    UICorner_Window.CornerRadius = UDim.new(0,8)
    UICorner_Window.Parent = Window

    return self
end

function NEVERLOSE:AddTab(Name, Icon, CategoryLabel)
    local tabLogic = {}
    
    -- Original TabLabel logic if category is provided
    if CategoryLabel then
        local TabLabel = Instance.new('TextLabel')
        TabLabel.Name = "TabLabel"
        TabLabel.Size = UDim2.new(1, 0, 0.015, 0)
        TabLabel.BackgroundTransparency = 1
        TabLabel.Text = CategoryLabel
        TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabLabel.TextScaled = true
        TabLabel.Font = Enum.Font.SourceSansBold
        TabLabel.TextTransparency = 0.5
        TabLabel.TextXAlignment = Enum.TextXAlignment.Left
        TabLabel.Parent = self.TabList
        
        local UIAspectRatioConstraint_2 = Instance.new('UIAspectRatioConstraint')
        UIAspectRatioConstraint_2.AspectRatio = 10
        UIAspectRatioConstraint_2.Parent = TabLabel
    end

    -- [ORIGINAL TAB BUTTON VALUES]
    local TabButton = Instance.new('Frame')
    TabButton.Name = "TabButton"
    TabButton.Size = UDim2.new(0.98, 0, 0.024, 0)
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundTransparency = 0.7
    TabButton.Parent = self.TabList

    local Label = Instance.new('TextLabel')
    Label.Name = "Label"
    Label.Position = UDim2.new(0.2353, 0, 0.158, 0)
    Label.Size = UDim2.new(0.6, 0, 0.62, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
    Label.Parent = TabButton

    local UICorner = Instance.new('UICorner')
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = TabButton

    local UIAspectRatioConstraint = Instance.new('UIAspectRatioConstraint')
    UIAspectRatioConstraint.AspectRatio = 5
    UIAspectRatioConstraint.Parent = TabButton

    local TabIcon = Instance.new('ImageLabel')
    TabIcon.Name = "TabIcon"
    TabIcon.Position = UDim2.new(0.059, 0, 0.21, 0)
    TabIcon.Size = UDim2.new(0.1, 0, 0.5, 0)
    TabIcon.BackgroundTransparency = 1
    TabIcon.Image = Icon or ""
    TabIcon.ImageColor3 = Color3.fromRGB(50, 5, 128)
    TabIcon.Parent = TabButton

    -- [CONTAINER FOR THIS TAB]
    local TabHose = Instance.new('Frame')
    TabHose.Name = "TabHose"
    TabHose.Position = UDim2.new(0.016, 0, 0.1, 0)
    TabHose.Size = UDim2.new(0.9464, 0, 0.86, 0)
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
    Instance.new('UIListLayout', Left).Padding = UDim.new(0,4)

    local Right = Instance.new('Frame')
    Right.Name = "Right"
    Right.Size = UDim2.new(0.488, 0, 1, 0)
    Right.BackgroundTransparency = 1
    Right.Parent = Container
    Instance.new('UIListLayout', Right).Padding = UDim.new(0,4)

    -- Tab Switching Logic
    local function Select()
        if self.CurrentTab then
            self.CurrentTab.Button.BackgroundTransparency = 1
            self.CurrentTab.Hose.Visible = false
        end
        self.CurrentTab = {Button = TabButton, Hose = TabHose}
        TabButton.BackgroundTransparency = 0.7
        TabHose.Visible = true
        
        -- Animation
        TabHose.Position = UDim2.new(0.016, 0, 0.15, 0)
        TweenService:Create(TabHose, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Position = UDim2.new(0.016, 0, 0.1, 0)}):Play()
    end

    TabButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then Select() end
    end)

    if not self.CurrentTab then Select() end

    function tabLogic:AddSection(SectionName, Side)
        local TargetColumn = (Side == "Right" and Right or Left)
        
        -- [ORIGINAL SECTION LABEL VALUES]
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
        SectionLabel.Parent = TargetColumn

        local UIAspectRatioConstraint_3 = Instance.new('UIAspectRatioConstraint')
        UIAspectRatioConstraint_3.AspectRatio = 5
        UIAspectRatioConstraint_3.Parent = SectionLabel

        -- [ORIGINAL SECTION FRAME VALUES]
        local section = Instance.new('Frame')
        section.Name = "section"
        section.Size = UDim2.new(1, 0, 0, 0)
        section.BackgroundColor3 = Color3.fromRGB(23, 23, 31)
        section.AutomaticSize = Enum.AutomaticSize.Y
        section.Parent = TargetColumn

        local UIStroke = Instance.new('UIStroke')
        UIStroke.Color = Color3.fromRGB(29, 29, 29)
        UIStroke.Thickness = 1
        UIStroke.Parent = section

        local UICorner_8 = Instance.new('UICorner')
        UICorner_8.CornerRadius = UDim.new(0, 8)
        UICorner_8.Parent = section

        local UIListLayout_4 = Instance.new('UIListLayout')
        UIListLayout_4.Padding = UDim.new(0, 4)
        UIListLayout_4.Parent = section
        
        -- Inner Padding
        local UIPadding = Instance.new("UIPadding")
        UIPadding.PaddingTop = UDim.new(0, 5)
        UIPadding.PaddingLeft = UDim.new(0, 8)
        UIPadding.Parent = section

        return section
    end

    return tabLogic
end

return NEVERLOSE
