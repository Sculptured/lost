--HUGE THANKS TO CHRIS LAD. (orignal uploader.)
--Silent#7114 you're not a dev, you're a skid without the capabilties to credit people < Also telling people to kys ins't great.
--Thanks andy for helping me figure out a loop to then get this to where its at now.
--Thanks jesus for not only coming in and not only debugging but becoming a second helping hands on this project <3

util.keep_running()
util.require_natives(1651208000)

MenuA =  menu.action
MenuL = menu.list
MenuR = menu.my_root()


--root list
menu.divider(menu.my_root(), "Special Crate related")
MoneyRoot = MenuL(MenuR, "Money Making", {}, "")
GenRoot = MenuL(MenuR, "General Features", {}, "random stuff i threw in here.")
TpRoot = MenuL(MenuR, "Teleports")
LogRoot = menu.list(menu.my_root(), "Change Log", {}, "Change log + Version. ")
CreditRoot = MenuL(MenuR, "Credits", {}, "People who helped/supported.")

--root list end

--load text
local YOURUSERNAME = "kool kid"
util.toast("Loaded ilanas skidded script !\nYou're a "..YOURUSERNAME.."")
--end load text

-----------------------------------------------------------------------------------------------------------------------------------------

--Begin Change+Ver Log
menu.readonly(LogRoot, "Implementing new features")
menu.readonly(LogRoot, "added sell delays")
menu.readonly(LogRoot, "stabalised sell loop slightly")
menu.divider(LogRoot, "Script Version")
menu.readonly(LogRoot, "version 0.0.4")
--end change+ver log

--Begin credits
menu.action(CreditRoot, "you", {""}, "", function(on_click)
	util.toast("Thank you, yes you. for using my shitty skidded script")
end)

menu.action(CreditRoot, "chris", {""}, "", function(on_click)
	util.toast("Thank you ChrisLad#9487 for uploading the script originally")
end)

menu.action(CreditRoot, "Icy+Vsus", {""}, "", function(on_click)
	util.toast("Huge thanks to vsus/ren and IcyPhoneix for making MB in the first place.")
end)

menu.action(CreditRoot, "Andy", {""}, "", function(on_click)
    util.toast("Big thanks to Anwy for the help aswell as teaching me certain things.")
end) 

menu.action(CreditRoot, "Jesus", {""}, "", function(on_click)
    util.toast("Thank you Jesus_is_cap for helping with coding + debugging!")
end)

menu.action(CreditRoot, "Ren", {""}, "", function(on_click)
    util.toast("Thank you Ren for the motivation to work on this. <3")
end)

--End Credits

-----------------------------------------------------------------------------------------------------------------------------------------

--Start tp Section
menu.divider(TpRoot, "FPS TPs to stop transError")
menu.action(TpRoot, "TP | Hanger", {"tphanger"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -930.89166, -2947.7917, 25.594482, 0, 0, 0)
end)

menu.action(TpRoot, "TP | Gods Thumb", {"tpgodthumb"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -986.18774, 6253.837, 2.682039, 0, 0, 0)
end)

menu.action(TpRoot, "TP | Cable Cart", {"tpcable"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, 413.31113, 5572.6914, 779.84125, 0, 0, 0)
end)

menu.action(TpRoot, "TP | Avi's hut", {"tpavihut"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -2169.1309, 5195.2827, 16.880398, 0, 0, 0)
end)
--End tp Section

-----------------------------------------------------------------------------------------------------------------------------------------------

--Start Jerry Script Skidded Code
local Int_PTR = memory.alloc_int()

    local function getMPX()
        return 'MP'.. util.get_char_slot() ..'_'
    end

    local function STAT_GET_INT(Stat)
        STATS.STAT_GET_INT(util.joaat(getMPX() .. Stat), Int_PTR, -1)
        return memory.read_int(Int_PTR)
    end

--End Jerry Script Skidded Code

-----------------------------------------------------------------------------------------------------------------------------------------------

--Start MB cargo Help 

function resupply()
    STATS._SET_PACKED_STAT_BOOL(32359 + 0, true,  util.get_char_slot())
    memory.write_int(memory.script_global(2689235 + 1 + (players.user() * 453) + 318 + 6), -1)
end

menu.toggle_loop(MoneyRoot, "Remove transaction pending", {"Transaction pending"}, "Use if Transaction pending is fucking with you", function(on_click)
    menu.trigger_commands("removetransactionpending")
end)

    menu.slider(MoneyRoot, "Sell Speed)", {"mbcspeed"}, "Modify Sell Speed (in miliseconds)",1000,4000, tonumber(0),25 ,function(speed_value)
    util.yield()
    speed = speed_value
end)

menu.toggle_loop(MoneyRoot, "Crate Sell Loop", {"sourceloop"}, "Make sure to set a loop speed before enabling this", function(on_click)
    menu.trigger_commands("sellacrate")
    util.yield(speed)
    if STAT_GET_INT("CONTOTALFORWHOUSE0",12) <= 5 then
    util.yield(0)
    resupply()
end
end)

menu.toggle_loop(MoneyRoot, "No RP", {"NoRP"}, "", function(on_click)
    util.draw_debug_text("RP Disabled")
    memory.write_float(memory.script_global(262145 + 1), 0)
end, function()
    memory.write_float(memory.script_global(262145 + 1), 1)
end)

menu.action(MoneyRoot, "Source Crates", {"sourcecrate"}, "", function()
    if util.is_session_started() and not util.is_session_transition_active() then
        STATS._SET_PACKED_STAT_BOOL(32359 + 0, true, util.get_char_slot())
        memory.write_int(memory.script_global(2689235 + 1 + (players.user() * 453) + 318 + 6), -1)
    end
end)
--End MB cargo  help 

-----------------------------------------------------------------------------------------------------------------------------------------------

--Start GenStuff (thanks andyscript/andy as i dont know what to do for this)


menu.action(GenRoot, "Max Health", {"healself"}, "Heals your ped to its max health.",
function()
    local max_health = ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped())
    ENTITY.SET_ENTITY_HEALTH(players.user_ped(), max_health, 0)
end
)


menu.action(GenRoot, "Clean", {"cleanself"}, "Cleans your ped from all visible blood.",
function()
    PED.CLEAR_PED_BLOOD_DAMAGE(players.user_ped())
end
)


