if (!hasInterface) exitWith {};

_lastTick = CBA_missionTime - 10;

while {alive player && GEIGER_ACTIVE && ([] call geiger_fnc_hasGeiger)} do {
	// find the nearest radiation source within range
	_foundSource = false;
	_min = GEIGER_RANGE;
	{
		_foundSource = true;
		if (_x distance player < _min) then {
			_min = _x distance player;
		};
	} forEach (nearestObjects [getPos player, [RADSOURCE_CLASS], GEIGER_RANGE]);

	if (_foundSource) then {
		_sleep = 0.1*_min - 0.8 + (random 0.1*_min)-(0.1*_min/2);
		if (_sleep < 0.05) then {
			_sleep = 0.05;
		};
		if (_sleep > 5) then {
			_sleep = 3 + (random 4) - 2;
		};

		if (CBA_missionTime - _lastTick + (random 0.1*_min)-(0.1*_min/2) >= _sleep) then {
			// play tick sound
			_sound = "geiger_" + str (ceil random 3);
			playSound _sound;
			_lastTick = CBA_missionTime;
		};
	};
	sleep 0.05;
};

GEIGER_ACTIVE = false;