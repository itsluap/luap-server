cfg = {}

cfg.debug = false -- debug version to check some stuff [prints]
cfg.framework = "nunoradioman" --esx_old,esx_new,qbcore,vrp,vrpex,nunoradioman,standalone
cfg.interaction = "qbtarget" --qbtarget,qtarget,oxtarget,markermenu,gtav
cfg.dispatch = "nunoradioman" --nunoradioman,ps_dispatch,cd_dispatch,core_dispatch,outlawalert

cfg.police = {
	groups = {"cop","police"}, -- police groups
	amount = 0, -- police amount
}
cfg.timers = {
	global_timer = 0, -- This Timer is in Minutes
	reset_timer = 60, -- This Timer is in Minutes
	npc_timer = 300 -- This Timer is in Seconds
}
cfg.notification = {
    selected = "gtav", -- gtav,qbcore,esx
    notifications = {
        noitem = "You dont have the item needed for this action.", -- message
        nopolice = "Not enough cops online.", -- message
    },
}