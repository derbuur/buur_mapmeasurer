/*
This short script measures the length of a free drawn line. It is like a mapmeassure.
No needs for input Variables.
Written by buur (derbuur@googlemail.com)

*/
findDisplay 12 displayaddEventHandler ["MouseButtonDown",
	{if (_this select 5) then
		{
		myStartCoordinates = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [(_this select 2), (_this select 3)];
		myDistance = 0;
		((findDisplay 12) displayCtrl 51) ctrladdEventHandler ["MouseMoving",
			{_myActualCoordinates = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [(_this select 1),(_this select 2)];
			myDistance =  (_myActualCoordinates distance2D myStartCoordinates) + myDistance;
			myStartCoordinates = _myActualCoordinates
			}
			];
		}
	}
	];
findDisplay 12 displayaddEventHandler ["MouseButtonUp",
	{if (!isnil "myDistance" && myDistance > 1) then
		{
			hint format ["Distance: %1 meters",round myDistance];
			missionNamespace setVariable ["myDistance", nil];
			missionNamespace setVariable ["myStartCoordinates", nil];
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers "MouseMoving"
		};
	}];
