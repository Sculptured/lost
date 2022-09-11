-- Thanks ChrisLad#9487 for the script !.

--Silent#7114 you're not a dev, you're a skid without the capabilties to credit people.

util.keep_running()
util.require_natives(1651208000)

MenuA =  menu.action
MenuL = menu.list
MenuR = menu.my_root()

--root list
menu.divider(menu.my_root(), "CEO Crate seller")
MoneyRoot = MenuL(MenuR, "Money Making", {}, "")
StuffRoot = MenuL(MenuR, "Random stuff")
LogRoot = menu.list(menu.my_root(), "Change Log", {}, "Change log + Version. ")
CreditRoot = MenuL(MenuR, "Credits", {}, "People who deserve to be here")

--root list end




--load shit
local YOURUSERNAME = "virign"
util.toast("Loaded ilanas skidded script !\nYou're a "..YOURUSERNAME.."")

--load shit end


-- Start Changelog
menu.readonly(LogRoot, "Added TP shit")
menu.readonly(LogRoot, "Working on a source crate < still >")
menu.divider(LogRoot, "Script Version")
menu.readonly(LogRoot, "version 0.6.9")

-- End Changelog



-- Start Credits

menu.action(CreditRoot, "you", {""}, "", function(on_click)
	util.toast("Thank you, yes you. for using my shitty skidded script")
end)

menu.action(CreditRoot, "chris", {""}, "", function(on_click)
	util.toast("Thank you ChrisLad#9487 for uploading the script originally")
end)

menu.action(CreditRoot, "MB dev team", {""}, "", function(on_click)
	util.toast("Huge thanks to Ren and IcyPhoneix for making MB in the first place.")
end)
-- End Credits






-- Start Stuff sec
menu.divider(StuffRoot, "FPS TPs to stop transError")
menu.action(StuffRoot, "TP | Hanger", {"tphanger"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -930.89166, -2947.7917, 25.594482, 0, 0, 0)
end)

menu.action(StuffRoot, "TP | Gods Thumb", {"tpgodthumb"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -986.18774, 6253.837, 2.682039, 0, 0, 0)
end)

menu.action(StuffRoot, "TP | Cable Cart", {"tpcable"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, 413.31113, 5572.6914, 779.84125, 0, 0, 0)
end)

menu.action(StuffRoot, "TP | Avi's hut", {"tpavihut"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -2169.1309, 5195.2827, 16.880398, 0, 0, 0)
end)

menu.divider(StuffRoot, "Greifer safe TP's", {}, "Why you chose to do it in a public session idk?")
menu.action(StuffRoot, "TP | Orb proof", {"tporbproof"}, "", function(on_click)
    local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -153.74661, -969.49854, 109.14937, 0, 0, 0)
end)

menu.action(StuffRoot, "TP | Maze Garage", {"tpmazegarage"}, "", function(on_click)
    local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -82.47371, -808.58417, 36.43793, 0, 0, 0)
end)

menu.action(StuffRoot, "TP | Sechs garage", {"tpsechsgarage"}, "", function(on_click)
    local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, 996.2926, -48.117947, 74.954155, 0, 0, 0)
end)

--end stuff sec




-- Start Jerry Script Skidded Code

local Int_PTR = memory.alloc_int()

    local function getMPX()
        return 'MP'.. util.get_char_slot() ..'_'
    end

    local function STAT_GET_INT(Stat)
        STATS.STAT_GET_INT(util.joaat(getMPX() .. Stat), Int_PTR, -1)
        return memory.read_int(Int_PTR)
    end
    
-- End Jerry Script Skidded Code




--start money shit
local function getBestWarehouse()
    local bestWHcount = 0
    local bestWH = ""

    for i = 0, 4, 1 do
        local wh = 'CONTOTALFORWHOUSE' .. i
        local c = STAT_GET_INT(wh)
        if c > bestWHcount then
            bestWHcount = c
            bestWH = wh
        end
    end

    if bestWH ~= "" then
        return bestWH
    else
        return "CONTOTALFORWHOUSE0"
    end
end

local whousecrates = STAT_GET_INT(getBestWarehouse())
menu.toggle_loop(MoneyRoot, "Auto Sell", {"AutoCrate"}, "Uses Click to sell a crate automatically. <Wait for the auto sell to stop completely or else it'll freeze your shit>", function()
    
    whousecrates = STAT_GET_INT(getBestWarehouse()) -- Checks per run
    for i = 0, (whousecrates * 2) do

        if i == (whousecrates * 2) -1 or i == (whousecrates * 2) then
            util.toast("out of crates dumbass")
            menu.trigger_commands("AutoCrate")
        else
            menu.trigger_commands("sellacrate")
            util.yield(2545)
        end 
    end
end)

menu.toggle_loop(MoneyRoot, "Remove transaction pending", {"Transaction pending"}, "Use if Transaction pending is fucking with you", function(on_click)
    menu.trigger_commands("removetransactionpending")
end)

menu.divider(MoneyRoot, "300k loop")

menu.action(MoneyRoot, "NC TP", {"TPNC"}, "Saves you a few seconds going to MB.", function(on_click)
    menu.trigger_commands("tpnightclub")
end)

menu.action(MoneyRoot, "NCSafe TP", {"TPsafe"}, "Saves you a few seconds going to MB.", function(on_click)
    menu.trigger_commands("tpncsafe")
end)


menu.action(MoneyRoot, "Set max safe", {"maxnc"}, "Saves you doing it in MB once again.", function(on_click)
    menu.trigger_commands("setcapncsafe 3000000")
 util.toast("Capacity set!")
 end)
 
 
 menu.action(MoneyRoot, "Set Max Revenue", {"maxrev"}, "Literally no faster than mb. my script is just above so its quicker..", function(on_click)
    menu.trigger_commands("revenuencsafe 300000")
util.toast("idk why i added this tbh. Revenue changed!")
end)

menu.action(MoneyRoot, "Set no delay", {"noncdelay"}, "dunno tbh.", function(on_click)
    menu.trigger_commands("ncafkloopdelay 0")
util.toast("Delay changed!")
end)

menu.action(MoneyRoot, "Start 300K loop", {"Nightclub 300k loop."}, "Starts the afk loop.", function(on_click)
    menu.trigger_commands("ncafkloop")
end)

--end money shit