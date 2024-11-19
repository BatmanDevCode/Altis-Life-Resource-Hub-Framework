/*
    File: initServer.sqf
    Author:

    Description:
    Starts the initialization of the server.
*/

[] call compile preprocessFileLineNumbers "\life_server\init.sqf";


//Future bomb placement on cars: (BETA)
while {true} do {
    {
        if (local _x) then {
            if (_x isKindOf "LandVehicle") then {
                if (player hasWeapon "hgun_pistol_heavy_01_F") then {
                    if (isNil {_x getVariable "hasBombAction"}) then {
                        _x addAction ["Plant Bomb", "scripts\plant_bomb.sqf", nil, 5, false, true, "", ""];
                        _x setVariable ["hasBombAction", true];
                    };
                } else {
                    if (!isNil {_x getVariable "hasBombAction"}) then {
                        _x removeAction (_x getVariable ["bombActionID", -1]);
                        _x setVariable ["hasBombAction", nil];
                    };
                };

                if (_x getVariable ["bombPlanted", false]) then {
                    if (isNil {_x getVariable "hasDetonateAction"}) then {
                        _x addAction ["Detonate Bomb", "scripts\detonate_bomb.sqf", nil, 5, false, true, "", ""];
                        _x setVariable ["hasDetonateAction", true];
                    };
                } else {
                    if (!isNil {_x getVariable "hasDetonateAction"}) then {
                        _x removeAction (_x getVariable ["detonateActionID", -1]);
                        _x setVariable ["hasDetonateAction", nil];
                    };
                };
            };
        };
    } forEach nearestObjects [player, ["LandVehicle"], 50];

    sleep 1;
};
