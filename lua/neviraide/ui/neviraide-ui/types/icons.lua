---@alias Icon string
---@alias RenderIcon fun(handle_icon:string, nonicon_name:string, space_before?: integer, space_after?:integer):Icon
---@alias Decoder fun(icon_code?: integer):string
---@alias space fun(spaces?: integer):string Function for creating string of spaces.

---@class Nonicons<enum>

---@class IconUtils<table>
---@field icon RenderIcon Funtion for creating string with icon and spases before/after it.
---@field decoder Decoder Function for decoding code of icon to the symbol.
