{
    if (local _x) then {
        _x addAction ["Plant Bomb", "Dream\plant_bomb.sqf", _x, 1, false, true, "", "player == _target && !(_target getVariable ['bombPlanted', false])"];
    };
} forEach vehicles;
