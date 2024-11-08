/*
	File: fn_welcomeNotification.sqf
	Description: Adds some text as the player loads in.
*/

private _MainConfig = missionConfigFile >> "ALRH_Config" >> "Setup";
private _name = getText(_MainConfig >> "ServerName");
private _ts = getText(_MainConfig >> "TeamSpeak");
private _discord = getText(_MainConfig >> "Discord");

_onScreenTime = 5;

private _array = [];

// Push notifications with _memberNames populated with _ts and _discord values
_array pushBack [(format ["Welcome to %1", _name]), [(format ["%1 Life", worldName])]];
_array pushBack ["Join Our Teamspeak", [_ts]];
_array pushBack ["Join Our Discord", [_discord]];
_array pushBack ["Enjoy Your Time", [profileName]];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;

	_finalText = format ["<t size='0.55' color='#00A91C' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#ffffff' align='right'>";

	{
		_finalText = _finalText + format ["%1<br />", _x]
	} forEach _memberNames;

	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.9);

	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;

	sleep (_onScreenTime);
} forEach _array;
