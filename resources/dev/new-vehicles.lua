QBShared = QBShared or {}
QBShared.VehicleHashes = {}

QBShared.Vehicles = {
	
    -- (( STARTING NEW, GRAB OLD CAR INFO FROM old-vehicles.lua)) --

    ------------ IRL BRANDED CARS FROM HERE --------------------

	-- PD CARS --
	
	['poldemonrb'] = {
        ['name'] = 'Police Demon',
        ['brand'] = 'Dodge',
        ['model'] = 'poldemonrb',
        ['price'] = 1000000,
        ['category'] = 'muscle',
        ['hash'] = `poldemonrb`,
        ['shop'] = 'luap',
    },

	-- LUAP VEHICELS --
	['chr20'] = {
        ['name'] = '2020 Hellcat',
        ['brand'] = 'Dodge',
        ['model'] = 'chr20',
        ['price'] = 1000000,
        ['category'] = 'muscle',
        ['hash'] = `chr20`,
        ['shop'] = 'luap',
    },
	['redeye'] = {
        ['name'] = 'Redeye',
        ['brand'] = 'Dodge',
        ['model'] = 'redeye',
        ['price'] = 1000000,
        ['category'] = 'muscle',
        ['hash'] = `redeye`,
        ['shop'] = 'luap',
    },
	['drer36'] = {
        ['name'] = 'R36 GTR',
        ['brand'] = 'Nissan',
        ['model'] = 'drer36',
        ['price'] = 1000000,
        ['category'] = 'muscle',
        ['hash'] = `drer36`,
        ['shop'] = 'luap',
    },
	--[[
	['bdragon'] = {
        ['name'] = 'Bentley Dragon',
        ['brand'] = 'Bentley',
        ['model'] = 'bdragonblue',
        ['price'] = 1000000,
        ['category'] = 'sports',
        ['hash'] = `bdragonblue`,
        ['shop'] = 'luap',
    },
	]]--
	['m3e36'] = {
        ['name'] = 'M3 E36',
        ['brand'] = 'BMW',
        ['model'] = 'm3e36',
        ['price'] = 1000000,
        ['category'] = 'sports',
        ['hash'] = `m3e36`,
        ['shop'] = 'luap',
    },
	['cz4a'] = {
        ['name'] = 'Evo X',
        ['brand'] = 'Mitsubishi',
        ['model'] = 'cz4a',
        ['price'] = 1000000,
        ['category'] = 'luap',
        ['hash'] = `cz4a`,
        ['shop'] = 'luap',
    },
	['rmodm4gts'] = {
        ['name'] = 'M4 GTS',
        ['brand'] = 'BMW',
        ['model'] = 'rmodm4gts',
        ['price'] = 1000000,
        ['category'] = 'luap',
        ['hash'] = `rmodm4gts`,
        ['shop'] = 'luap',
    },
	-- king -- 
	['navigator'] = {
        ['name'] = 'Navigator',
        ['brand'] = 'Lincoln',
        ['model'] = 'navigator',
        ['price'] = 1000000,
        ['category'] = 'sports',
        ['hash'] = `navigator`,
        ['shop'] = 'king',
    },
	['rmodf40'] = {
        ['name'] = 'F40',
        ['brand'] = 'Ferrari',
        ['model'] = 'rmodf40',
        ['price'] = 1000000,
        ['category'] = 'sports',
        ['hash'] = `rmodf40`,
        ['shop'] = 'king',
    },
	--------- 1of1 -------------------------

	['leikam2'] = {
        ['name'] = 'M2',
        ['brand'] = 'BMW',
        ['model'] = 'leikam2',
        ['price'] = 1000000,
        ['category'] = 'sports',
        ['hash'] = `leikam2`,
        ['shop'] = '1of1',
    },

	['ttsto'] = {
        ['name'] = 'Huracan STO',
        ['brand'] = 'Lamborghini',
        ['model'] = 'ttsto',
        ['price'] = 1000000,
        ['category'] = 'sports',
        ['hash'] = `ttsto`,
        ['shop'] = '1of1',
    },

	----------------------------------------
	
}

for _, v in pairs(QBShared.Vehicles) do
	QBShared.VehicleHashes[v.hash] = v
end
