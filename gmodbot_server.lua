util.AddNetworkString( "bpf-position" )

local doors = {
	["func_door_rotating"] = true,
	["prop_door_rotating"] = true,
	["func_door_rotating"] = true
}

concommand.Add("bpf_generatedoors", function( ply, cmd, args )
	local allDoors = {}
    for k, v in pairs( ents.GetAll() ) do
    	if doors[v:GetClass()] then
    		local doorClass = v:GetClass()

    		local pos = v:GetPos()
    		local posstr = tonumber(math.floor(pos.x)) .." "..tonumber(math.floor(pos.y)).." "..tonumber(math.floor(pos.z))

    		if ( doorClass == "func_door" or doorClass == "func_door_rotating" ) then
    			local isopen = v:GetInternalVariable( "m_toggle_state" ) == 0
    			allDoors[posstr] = {tonumber(math.floor(v:GetAngles().yaw)), isopen}
    		elseif ( doorClass == "prop_door_rotating" ) then
    			local isopen = v:GetInternalVariable( "m_eDoorState" ) ~= 0
    			allDoors[posstr] = {tonumber(math.floor(v:GetAngles().yaw)), isopen}
    		end
    	end
    end

    file.Write( "bpf-doors-"..game.GetMap()..".txt", util.TableToJSON(allDoors) )
end)

net.Receive( "bpf-position", function( len, ply )
    ply.vieworigin = net.ReadVector()
end )

hook.Add("SetupPlayerVisibility", "bpf-visible", function(pPlayer, pViewEntity)
	AddOriginToPVS(pPlayer.vieworigin or pPlayer:GetPos())
end)