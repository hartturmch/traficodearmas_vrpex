local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_traficodearmas",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"aco.permissao")
end

function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		local pqtd = #policia*10
		local qtd = math.random(150,200)
		print("pqtd"..pqtd)
		print("qtd"..qtd)
		print(pqtd+qtd)
		vRP.giveInventoryItem(user_id,"aco",qtd+pqtd)
		TriggerClientEvent("Notify",source,"aviso","Você recebeu <b>"..qtd.." aço(s)</b>.")
		return true
	end
end