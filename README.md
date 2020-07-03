# Gasmask Script
Geiger counter script for Arma 3. Uses objects defined as radiation sources to play geiger clicks when player gets too close.

Init function is called from initServer.sqf with desired parameters.

Steps for usage:
1. Merge scripts folder with existing scripts folder in mission folder (if it exists).
2. Merge description.ext.
3. Call geiger_fnc_init from initServer.sqf with desired parameters, see below for example.

Make sure the init function is called from initServer.sqf.

Example call:
```sqf
[_geigerItem, _radSourceClass] spawn geiger_fnc_init;
```
Defaults:
```sqf
["", "Sign_Sphere10cm_F"] spawn geiger_fnc_init;
```

## Changelog
### 03/07/2020
- Initial upload.