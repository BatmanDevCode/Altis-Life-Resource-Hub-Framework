// detonate_bomb.sqf

_vehicle = _this select 0;  // Get the vehicle from the parameters
_player = _this select 1;   // Get the player who planted the bomb

// Ensure the vehicle has a bomb planted
if (_vehicle getVariable ["bombPlanted", false]) then {
    _bomb = _vehicle getVariable ["bombObject", nil]; // Retrieve the bomb object

    if (!isNil "_bomb") then {
        // Create an explosion at the bomb's position
        _bombPos = position _bomb;  // Get the position of the bomb
        _explosion = "Bo_GBU12_LGB" createVehicle _bombPos;  // Create an explosion at the bomb's position

        // Apply damage to the vehicle (optional)
        _vehicle setDamage 1;  // This will destroy the vehicle

        // Optionally, you can delete the bomb object (if not done earlier)
        deleteVehicle _bomb;

        // Display detonation message
        hint "Bomb detonated!";

        // Reset the vehicle's bomb status
        _vehicle setVariable ["bombPlanted", false];  // Reset the bomb status
        _vehicle setVariable ["bombObject", nil];  // Clear the bomb object reference

        // Remove the detonate action from the player after it is used
        _player removeAction (_player getVariable ["bombActionID", -1]);
    } else {
        hint "No bomb found to detonate.";  // Error handling if no bomb exists
    };
};
