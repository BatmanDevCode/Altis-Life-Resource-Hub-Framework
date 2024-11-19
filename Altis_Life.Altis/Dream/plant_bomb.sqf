_player = player;
_vehicle = nearestObject [_player, "LandVehicle"];

if (_vehicle != _player) then {
    if (_player hasWeapon "hgun_pistol_heavy_01_F") then {
        hint "Starting bomb planting animation...";

        _player playMoveNow "AinvPknlMstpSnonWnonDnon";

        sleep 5;

        hint "Bomb planting finished, creating bomb...";

        _bomb = "Land_Mine_01_F" createVehicle position _vehicle;
        _bomb setPos [position _vehicle select 0, position _vehicle select 1, (position _vehicle select 2) + 0.5];
        _bomb attachTo [_vehicle, [0, 0, 0.5]];

        _vehicle setVariable ["bombObject", _bomb];
        _vehicle setVariable ["bombPlanted", true];
        _vehicle setVariable ["bombPlantedBy", _player];

        _player addAction ["Detonate Bomb", "Dream\detonate_bomb.sqf", [_vehicle, _player], 5, false, true, "", "(_this select 1) == _player"];

        _player removeWeapon "hgun_pistol_heavy_01_F";

        hint "Bomb planted on the vehicle!";
    } else {
        hint "You need a heavy pistol to plant the bomb!";
    };
} else {
    hint "You must be close to a vehicle to plant a bomb.";
};
