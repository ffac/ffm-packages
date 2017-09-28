local uci = require("simple-uci").cursor()

local f, s, o, fct

local f = Form('Taster')
local s = f:section(Section, nil, "Hier können dem Router-Taster unterschiedliche Funktionalitäten zugeordnet werden.")

local fct = uci:get('button-bind', 'wifi', 'function')
if not fct then
	fct='1'
	uci:set('button-bind', 'wifi', 'button')
	uci:set('button-bind', 'wifi', 'function', fct)
	uci:commit('button-bind')
end
local o = s:option(ListValue, "wifi", "Wifi ON/OFF Taster")
o.default = fct
o:value('0', "Wifi an/aus")
o:value('1', "Funktionslos (default)")
o:value('2', "Wifi-Reset")
o:value('3', "alle Status-LEDs an/aus (Nachtmodus 1)")
o:value('4', "LEDs aus, an beim Drücken (Nachtmodus 2)")
o:value('5', "Client-Netz an/aus")
o:value('6', "Mesh-VPN aus für 5 Stunden")

function f:write(data)
	uci:set('button-bind', 'wifi', 'function', data)
end

function f:write()
	uci:commit('button-bind')
end

return f
