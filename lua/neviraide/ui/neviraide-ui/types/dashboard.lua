---@alias DashboardLogoType string[]

---@alias DashboardButton table<string> Title, icon and command.
---@alias DashboardButtons table<DashboardButton> Table of dashboard buttons.

---@alias DashButtonCreator fun(title:string, icon: string, nonicon: string, command: string):DashboardButton Helper for creating dashboard buttons.

---@class DashboardLogo<table>
---@field short DashboardLogoType
---@field long DashboardLogoType
