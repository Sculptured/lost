--HUGE THANKS TO CHRIS LAD. (orignal uploader.)
--Silent#7114 you're not a dev, you're a skid without the capabilties to credit people < Also telling people to kys ins't great.


util.keep_running()
util.require_natives(1651208000)

MenuA =  menu.action
MenuL = menu.list
MenuR = menu.my_root()


--root list
menu.divider(menu.my_root(), "Special Crate related")
MoneyRoot = MenuL(MenuR, "Money Making", {}, "")
NightRoot = MenuL(MenuR, "Overnight money", {}, "For if you're really lazy and dont wanna use MB.")
MiscRoot = MenuL(MenuR, "Misc")
LogRoot = menu.list(menu.my_root(), "Change Log", {}, "Change log + Version. ")
CreditRoot = MenuL(MenuR, "Credits", {}, "People who helped/supported.")

--root list end

--load text
local YOURUSERNAME = "kool kid"
util.toast("Loaded ilanas skidded script !\nYou're a "..YOURUSERNAME.."")
--end load text

--Begin Change+Ver Log

menu.readonly(LogRoot, "Some Features are still missing,.")
menu.readonly(LogRoot, "Reworking Script Still.")
menu.divider(LogRoot, "Script Version")
menu.readonly(LogRoot, "version 0.0.2")
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
    util.toast("Big thanks for the help aswell as teaching me certain things.")
end) 

--End Credits

-----------------------------------------------------------------------------------------------------------------------------------------

--Start Misc Section
menu.divider(MiscRoot, "FPS TPs to stop transError")
menu.action(MiscRoot, "TP | Hanger", {"tphanger"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -930.89166, -2947.7917, 25.594482, 0, 0, 0)
end)

menu.action(MiscRoot, "TP | Gods Thumb", {"tpgodthumb"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -986.18774, 6253.837, 2.682039, 0, 0, 0)
end)

menu.action(MiscRoot, "TP | Cable Cart", {"tpcable"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, 413.31113, 5572.6914, 779.84125, 0, 0, 0)
end)

menu.action(MiscRoot, "TP | Avi's hut", {"tpavihut"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -2169.1309, 5195.2827, 16.880398, 0, 0, 0)
end)
--End misc Section

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


--Start MB cargo Help 
menu.toggle_loop(MoneyRoot, "Remove transaction pending", {"Transaction pending"}, "Use if Transaction pending is fucking with you", function(on_click)
    menu.trigger_commands("removetransactionpending")
end)

menu.action(MoneyRoot, "Source Crates", {"sourcecrate"}, "", function()
    if util.is_session_started() and not util.is_session_transition_active() then
        STATS._SET_PACKED_STAT_BOOL(32359 + 0 --[[value from 0-4 depending on current active warehouse.]], true, util.get_char_slot())
        memory.write_int(memory.script_global(2689235 + 1 + (players.user() * 453) + 318 + 6), -1)
    end
end)


menu.toggle_loop(MoneyRoot, "Source Loop", {"sourceloop"}, "", function(on_click)
    menu.trigger_commands("sourcecrate", 111)
    util.yield(2000)
end)

menu.toggle_loop(MoneyRoot, "No RP", {"NoRP"}, "", function(on_click)
    util.draw_debug_text("RP Disabled")
    memory.write_float(memory.script_global(262145 + 1), 0)
end, function()
    memory.write_float(memory.script_global(262145 + 1), 1)
end)











