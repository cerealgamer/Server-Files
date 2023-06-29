
-- this module define the emotes menu

local cfg = module("cfg/emotes")
local lang = vRP.lang

local emotes = cfg.emotes

local function ch_emote(player,choice)
  local emote = emotes[choice]
  if emote then
    vRPclient.playAnim(player,{emote[1],emote[2],emote[3]})
  end
end