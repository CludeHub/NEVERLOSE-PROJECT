local NEVERLOSE = {}
NEVERLOSE.__index = NEVERLOSE

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function NEVERLOSE.new(HubText, HubImage, GameName, WindowSize)
	local self = setmetatable({}, NEVERLOSE)

	-- Main Gui Setup
	local ScreenGui = Instance.new('ScreenGui')
	ScreenGui.Name = "NEVERLOSE_UI"
	ScreenGui.Parent = game:GetService("CoreGui")
	self.Gui = ScreenGui

	-- Main Window
	local Window = Instance.new('Frame')
	Window.Name = "Window"
	Window.Position = UDim2.new(0.5, -315, 0.5, -225)
	Window.Active = true
	Window.Draggable = true
	Window.Size = WindowSize or UDim2.new(0, 630, 0, 450)
	Window.BackgroundColor3 = Color3.fromRGB(11, 13, 27)
	Window.BackgroundTransparency = 0.02
	Window.BorderSizePixel = 0
	Window.Parent = ScreenGui
	self.Main = Window

	local UICorner_2 = Instance.new('UICorner', Window)
	UICorner_2.CornerRadius = UDim.new(0, 8)

	-- Elements from your original script
	local GameTitle = Instance.new('TextLabel', Window)
	GameTitle.Name = "GameTitle"
	GameTitle.Position = UDim2.new(0.074, 0, 0.05, 0)
	GameTitle.Size = UDim2.new(0.2, 0, 0.022, 0)
	GameTitle.BackgroundTransparency = 1
	GameTitle.Text = GameName or "Counter Strike 2"
	GameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	GameTitle.TextScaled = true
	GameTitle.Font = Enum.Font.SourceSansBold
	GameTitle.TextTransparency = 0.5
	GameTitle.TextXAlignment = Enum.TextXAlignment.Left

	local Line1 = Instance.new('Frame', Window)
	Line1.Name = "Line1"
	Line1.Position = UDim2.new(0.015, 0, 0.09, 0)
	Line1.Size = UDim2.new(0.18, 0, 0, 1)
	Line1.BackgroundColor3 = Color3.fromRGB(73, 73, 73)
	Line1.BackgroundTransparency = 0.4

	local Line2 = Instance.new('Frame', Window)
	Line2.Name = "Line2"
	Line2.Position = UDim2.new(0.23, 0, 0.09, 0)
	Line2.Size = UDim2.new(0.76, 0, 0, 1)
	Line2.BackgroundColor3 = Color3.fromRGB(73, 73, 73)
	Line2.BackgroundTransparency = 0.4

	-- User Profile Section
	local UserIcon = Instance.new('ImageLabel', Window)
	UserIcon.Name = "UserIcon"
	UserIcon.Position = UDim2.new(0.013, 0, 0.91, 0)
	UserIcon.Size = UDim2.new(0.059, 0, 0.08, 0)
	UserIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 37)
	Instance.new('UICorner', UserIcon).CornerRadius = UDim.new(1, 0)

	local thumbType, thumbSize = Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420
	local success, imageUrl = pcall(function() return Players:GetUserThumbnailAsync(LocalPlayer.UserId, thumbType, thumbSize) end)
	if success then UserIcon.Image = imageUrl end

	local Username = Instance.new('TextLabel', Window)
	Username.Position = UDim2.new(0.074, 0, 0.924, 0)
	Username.Size = UDim2.new(0.1, 0, 0.03, 0)
	Username.BackgroundTransparency = 1
	Username.Text = LocalPlayer.Name
	Username.TextColor3 = Color3.fromRGB(255, 255, 255)
	Username.TextScaled = true
	Username.Font = Enum.Font.SourceSansBold
	Username.TextXAlignment = Enum.TextXAlignment.Left

	local Days = Instance.new('TextLabel', Window)
	Days.Position = UDim2.new(0.074, 0, 0.952, 0)
	Days.Size = UDim2.new(0.1, 0, 0.03, 0)
	Days.BackgroundTransparency = 1
	Days.Text = "9999 days left"
	Days.TextColor3 = Color3.fromRGB(255, 255, 255)
	Days.TextTransparency = 0.5
	Days.TextScaled = true
	Days.Font = Enum.Font.SourceSansBold
	Days.TextXAlignment = Enum.TextXAlignment.Left

	-- Navigation Hub
	local HubIcon = Instance.new('ImageLabel', Window)
	HubIcon.Position = UDim2.new(0.009, 0, 0.01, 0)
	HubIcon.Size = UDim2.new(0.049, 0, 0.059, 0)
	HubIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 31)
	HubIcon.Image = HubImage or ""
	Instance.new('UICorner', HubIcon).CornerRadius = UDim.new(0, 8)

	local Title = Instance.new('TextLabel', Window)
	Title.Position = UDim2.new(0.074, 0, 0.01, 0)
	Title.Size = UDim2.new(0.2, 0, 0.039, 0)
	Title.BackgroundTransparency = 1
	Title.Text = HubText or "Neverlose"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.Font = Enum.Font.SourceSansBold
	Title.TextXAlignment = Enum.TextXAlignment.Left

	-- Sidebar Tab Scrolling
	self.TabHolder = Instance.new('ScrollingFrame', Window)
	self.TabHolder.Name = "TabHolder"
	self.TabHolder.Position = UDim2.new(0.012, 0, 0.1, 0)
	self.TabHolder.Size = UDim2.new(0.19, 0, 0.8, 0)
	self.TabHolder.BackgroundTransparency = 1
	self.TabHolder.ScrollBarThickness = 0
	self.TabHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
	self.TabHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local TabListLayout = Instance.new('UIListLayout', self.TabHolder)
	TabListLayout.Padding = UDim.new(0, 4)
	TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	-- Main Right Frame (where tabs appear)
	self.ContentArea = Instance.new('Frame', Window)
	self.ContentArea.Name = "ContentArea"
	self.ContentArea.Position = UDim2.new(0.219, 0, 0, 0)
	self.ContentArea.Size = UDim2.new(0.781, 0, 1, 0)
	self.ContentArea.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
	self.ContentArea.BackgroundTransparency = 0.1
	Instance.new('UICorner', self.ContentArea).CornerRadius = UDim.new(0, 8)

	self.Tabs = {}
	self.ActiveTab = nil

	return self
end

function NEVERLOSE:AddTab(Name, IconID)
	local TabButton = Instance.new('Frame', self.TabHolder)
	TabButton.Name = Name .. "Btn"
	TabButton.Size = UDim2.new(0.98, 0, 0, 30)
	TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabButton.BackgroundTransparency = 0.7
	Instance.new('UICorner', TabButton).CornerRadius = UDim.new(0, 5)

	local Aspect = Instance.new('UIAspectRatioConstraint', TabButton)
	Aspect.AspectRatio = 5

	local Label = Instance.new('TextLabel', TabButton)
	Label.Position = UDim2.new(0.235, 0, 0.158, 0)
	Label.Size = UDim2.new(0.6, 0, 0.62, 0)
	Label.BackgroundTransparency = 1
	Label.Text = Name
	Label.TextColor3 = Color3.fromRGB(255, 255, 255)
	Label.TextScaled = true
	Label.Font = Enum.Font.SourceSansBold
	Label.TextXAlignment = Enum.TextXAlignment.Left

	local Icon = Instance.new('ImageLabel', TabButton)
	Icon.Position = UDim2.new(0.059, 0, 0.21, 0)
	Icon.Size = UDim2.new(0.1, 0, 0.5, 0)
	Icon.BackgroundTransparency = 1
	Icon.Image = IconID or ""
	Icon.ImageColor3 = Color3.fromRGB(50, 5, 128)

	local Clicker = Instance.new("TextButton", TabButton)
	Clicker.Size = UDim2.new(1, 0, 1, 0)
	Clicker.BackgroundTransparency = 1
	Clicker.Text = ""

	-- The Page for this tab
	local Page = Instance.new('ScrollingFrame', self.ContentArea)
	Page.Name = Name .. "Page"
	Page.Size = UDim2.new(1, -20, 0.86, 0)
	Page.Position = UDim2.new(0.016, 0, 0.1, 0)
	Page.BackgroundTransparency = 1
	Page.ScrollBarThickness = 0
	Page.Visible = false
	Page.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local PageLayout = Instance.new('UIListLayout', Page)
	PageLayout.FillDirection = Enum.FillDirection.Horizontal
	PageLayout.Padding = UDim.new(0, 10)

	-- Left and Right columns inside Page
	local LeftCol = Instance.new("Frame", Page)
	LeftCol.Name = "Left"
	LeftCol.Size = UDim2.new(0.489, 0, 1, 0)
	LeftCol.BackgroundTransparency = 1
	local LList = Instance.new("UIListLayout", LeftCol)
	LList.Padding = UDim.new(0, 4)

	local RightCol = Instance.new("Frame", Page)
	RightCol.Name = "Right"
	RightCol.Size = UDim2.new(0.488, 0, 1, 0)
	RightCol.BackgroundTransparency = 1
	local RList = Instance.new("UIListLayout", RightCol)
	RList.Padding = UDim.new(0, 4)

	-- Tab Switching Logic + Animation
	Clicker.MouseButton1Click:Connect(function()
		for _, t in pairs(self.Tabs) do
			t.Page.Visible = false
			TweenService:Create(t.Btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.9}):Play()
		end
		Page.Visible = true
		Page.GroupTransparency = 1 -- Animation start
		TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.7}):Play()
		
		-- Simple Fade In Animation
		local fade = Instance.new("NumberValue")
		fade.Changed:Connect(function(val) Page.GroupTransparency = val end)
		TweenService:Create(fade, TweenInfo.new(0.3), {Value = 0}):Play()
	end)

	if #self.Tabs == 0 then
		Page.Visible = true
		TabButton.BackgroundTransparency = 0.7
	else
		TabButton.BackgroundTransparency = 0.9
	end

	table.insert(self.Tabs, {Btn = TabButton, Page = Page})

	local TabFuncs = {}
	function TabFuncs:AddSection(SectionName, Column)
		local ParentCol = (Column == "Right" and RightCol or LeftCol)
		
		local SectionLabel = Instance.new('TextLabel', ParentCol)
		SectionLabel.Size = UDim2.new(0.28, 0, 0.019, 0)
		SectionLabel.BackgroundTransparency = 1
		SectionLabel.Text = SectionName:upper()
		SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		SectionLabel.TextTransparency = 0.5
		SectionLabel.TextScaled = true
		SectionLabel.Font = Enum.Font.SourceSansBold
		SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
		Instance.new('UIAspectRatioConstraint', SectionLabel).AspectRatio = 5

		local section = Instance.new('Frame', ParentCol)
		section.Name = SectionName .. "Section"
		section.Size = UDim2.new(1, 0, 0, 0)
		section.BackgroundColor3 = Color3.fromRGB(23, 23, 31)
		section.AutomaticSize = Enum.AutomaticSize.Y
		
		Instance.new('UICorner', section).CornerRadius = UDim.new(0, 8)
		local Stroke = Instance.new('UIStroke', section)
		Stroke.Color = Color3.fromRGB(29, 29, 29)
		
		local SectionLayout = Instance.new('UIListLayout', section)
		SectionLayout.Padding = UDim.new(0, 4)
		
		return section
	end
	
	return TabFuncs
end

return NEVERLOSE
