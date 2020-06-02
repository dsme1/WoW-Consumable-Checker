local AceGUI = LibStub("AceGUI-3.0")
local texture, itemCount = GetContainerItemInfo(0,2);

local function DrawGroup(container)
    local group = AceGUI:Create("Label")
    group:SetText("This is Tab 1")
    group:SetFullWidth(true)
    container:AddChild(group)

    local button = AceGUI:Create("Button")
    button:SetText("Tab 1 Button")
    button:SetWidth(200)
    container:AddChild(button)

    local check = AceGUI:Create("CheckBox")
    check:SetValue(false)
    check:SetType("Checkbox")
    check:
end

local function DrawGroup2(container)
    local group = AceGUI:Create("Label")
    group:SetText("This is Tab 2")
    group:SetFullWidth(true)
    container:AddChild(group)
    
    local button = AceGUI:Create("Button")
    button:SetText("Tab 2 Button")
    button:SetWidth(200)
    button:SetCallback("OnClick", function() print(texture, itemCount) end)
    container:AddChild(button)
end

local function SelectGroup(container, event, group)
   container:ReleaseChildren()
   if group == "tab1" then
      DrawGroup(container)
   elseif group == "tab2" then
      DrawGroup2(container)
   end
end

local frame = AceGUI:Create("Frame")
frame:SetTitle("Example Frame")
frame:SetStatusText("Example Frame")
frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
frame:SetLayout("Fill")

local tab = AceGUI:Create("TabGroup")
tab:SetLayout("Flow")
tab:SetTabs({{text="Tab 1", value="tab1"}, {text="Tab 2", value="tab2"}})
tab:SetCallback("OnGroupSelected", SelectGroup)
tab:SelectTab("tab1")
frame:AddChild(tab)

