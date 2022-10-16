
  =======================================
  ======    Realistic Driving V    ======
  ====== GTA V vehicle physics mod ======
  =======================================

Version: 	2.5
Release date:	08.June.2018
 
Credits:	Olaf "Killatomate" von Fritsch (development, research, quality assurance, documentation, installer)
		ikt (scripting, creating additional tools)

  Links:
GTA5-Mods: www.gta5-mods.com/vehicles/realistic-driving-v
Moddb: 	   www.moddb.com/mods/realistic-driving-v
Youtube:   www.youtube.com/user/Killatomate85

Copyright:
DO NOT upload this mod, parts of this mod or modified versions of this mod without the author's permission!

=======================================================================
=======================================================================
Description:

This mod turns GTA V into a whole new game by changing the driving physics of every single car and bike
to be as realistic as possible (within the strict limits of GTA physics, hardcoded steering input, 
mission scripts and limited AI). Physics parameters have been created from scratch for each of the 
357 featured vehicles individually and carefully tailored to fit each unique 3D model.
This mod is offered in two different versions: Real Topspeed (max realism) and Scaled Topspeed (speed governor, brake assist).

Main features:
-Driving physics of 357 vehicles have been reworked, individually, one-by-one, from scratch.
  3.5 hours were spent on average on each vehicle to create vehicle handling tailored to each individual 3D model.
-Each individual car features handling characteristics of its real life counterpart:
  eg. Corvette C7 has strong brakes, low stability while braking and power oversteer on corner exit.
  Audi R8 v10 Plus has zero rear downforce and high stability on corner exit due to AWD.
  LaFerrari has understeery brake balance, good mid-turn grip and excess power oversteer
  McLaren F1 GTR has low weight, low weight transfer, responsive steering, strong rear downforce and no ABS.
-Each of 357 vehicles has been given the exact performance specs of its real life counterpart
  (acceleration, topspeed, braking, cornering, amount of wheelspin).
  Consequently a lot of time went into researching each vehicle's real life counterpart.
  Bugatti Chiron (Nero) will accelerate from 0 to 300kph in 13.8 seconds and top out at 430kph (270mph).
-All measurements (speed, acceleration, lateral acceleration, handling) have been made in game!
  No theory crafting! Every single change has been measured and confirmed ingame.
-Cars and bikes have been measured and tweaked on a skidpad to achieve more realistic cornering
-A racetrack was used to tweak laptimes of supercars to closely represent real life
  video of initial race track hotlapping: ( www.youtube.com/watch?v=Uzqgg9dCdLc )
-All cars have proper downforce added (This mod also employs downforce to cancel out upforce created by realistic suspension settings)
-More realistic suspension settings, every little bump in the road affects handling (possible with introduction of downforce)
-More realistic weight transfer, braking and cornering has big effect on tire grip and stability
-More realistic tire grip settings, cars drift more realistically and counter-steering is required
-More realistic collisions with cars and foliage. You can use the PIT-maneuver on other cars/cops.
-Reworked surfaces properties. All driveable surfaces have been reworked.
  Distinct differences between dirt tracks, sand, gravel, meadows, mud, swamps, shallow water. 
-Reworked effect of weather conditions on grip (rain, storm, frost)
-Removed 200kph speed cap on tarmac. Bugatti Chiron can reach 430 kph.
-Removed 130kph speed cap on dirt roads. Rally cars can go 230 kph.
-Introduction of non-ABS cars. Wheels can lock when too much brake pressure is applied
-Body and engine upgrades in the car shop affect car handling. Rear wings increase stabilty at high speed.
-Disabled automated brakes of each car and bike, making relaxed cruising possible
-Support for all DLCs up to "Smuggler's Run"
-Option for increased vehicle deformation

===========================================================
Content:

Version 2.5 features unique vehicle handling for 357 different vehicles. View "content.txt" for details.

Supported/required DLCs: 
ill Gotten Gains 1, ill Gotten Gains 2, Lowriders, Halloween, Executives, XMAS 3, January2016, Valentine, Lowriders 2,
Further Adventures in Finance, Cunning Stunts, Bikers, Import/Export, MPSpecialRaces, Gunrunning, Smuggler's Run,
Doomsday, SSA Super Sport Series.

Vehicle categories not included in this mod: Heavy Trucks, Helicopters, Planes, Boats

===========================================================
Input devices:

This mod works best when used with controller/gamepad (analog trigger and thumbstick recommended).
Handling characteristics of cars are significantly less detailed when using keyboard for input. 
Also you are missing out on Left-foot-braking, Skandinavian Flick, controlled power-oversteer 
and of course relaxed cruising at 20% throttle.

Steering Wheel
This mod has not been optimized for use with Steering Wheels.

===========================================================
Four versions of this mod to choose from:

'Real Topspeed' version:
This version features maximum realism. You will need to keep an eye on your speed if you want to survive.
Recommended for experienced players and suicidal speed-junkies. 
Bugatti Chiron's topspeed is 430 kmh (270 mph) in this version.

-----------------------------------------------------------
'Scaled Topspeed' version (recommended):
This version retains all important mod features (realisic grip, cornering, acceleration, braking, downforce, handling characteristics)
while deploying a subtle speed governor and brake assist to keep you (and the AI) from driving too fast for GTA V's design.
The assist is implemented in a way that does not affect tire physics.
This version offers highest compatibility with AI and story missions.
The speed scale in non-linear. Slow vehicles are less affected.
Every vehicle gets to keep its respective top speed advantage/disadvantage.
470kmh -> 242kmh
420kmh -> 236kmh
370kmh -> 232kmh
340kmh -> 225kmh
300kmh -> 211kmh
260kmh -> 198kmh
230kmh -> 189kmh
210kmh -> 178kmh
190kmh -> 170kmh
175kmh -> 166kmh

-----------------------------------------------------------
'Increased Vehicle Deformation' option:
This option increases deformation of vehicles in collisions. Low compatibility with story missions and AI races.
Use a trainer to repair your vehicle after collisions!

========================================================================================
========================================================================================
========================================================================================
INSTALLATION INSTRUCTIONS:

Disclaimer
While this mod is safe, tools required for modding may pose a risk to your computer. 
Download script files (*.exe, *.dll, *.asi, *.lua) from trusted sources only! 
Attempting to play GTA Online with modified files may result in a temporary ban. 
Deactivate your "ASI Loader" in the game folder before launching GTA Online.

-----------------------------------------------------------
Requirements:

-GTA V for PC (supported versions: 1.36, 1.38, 1.39, 1.41, 1.43+)
-OpenIV (modding tool)

-----------------------------------------------------------
Compatibility:

Due to low number of files modified, this mod is highly compatible with other mods. 
It works fine with all sorts of visual enhancements, trainers, weapon mods and maps.
An exception are mods which -replace- original car models (addon mods work fine). 
Since this mod is carefully tailored to the original car models it does not work properly with custom models. 
However, car models can be added manually to the handling.meta file after installing this mod.

===========================================================
Step 1: Installing OpenIV

-Download the modding tool "OpenIV 2.8" from ( www.openiv.com )
 This tool ist REQUIRED to run mods like this from a separate mod folder.
-Run setup and follow installation instructions.

After successful installation
-Launch "OpenIV" and navigate to "Tools/Asi Manager" Activate "Asi Loader" and "OpenIV.asi".
 This will enable loading of modified *.rpf game archives.

===========================================================
Step 2: Mod order!

-Large mod compilations (eg. Redux) and other large game modifications need to be installed BEFORE this mod

-Visual mods (VisualV, shader mods, texture mods) can be installed at ANY TIME
-Vehicle ADD-ONs (eg. IVPack) can be installed at ANY TIME
-custom car models (replacing original cars) need to be added MANUALLY to handling.meta, AFTER installing this mod

===========================================================
Step 3: Installing 'Realistic Driving' Mod

Important: "OpenIV.asi" needs to be present in the game folder before launching the installer!

-Launch "OpenIV" and navigate to "Tools/Package Installer".
  Browse to this mod's "installer" folder. Select an *.oiv file to begin installation.
-When prompted, choose the option "install into 'mods' folder". This will copy both the mod and required game files into a separate folder.
  Do not overwrite your original game files. You will have to redownload any modified archive.
If installer fails to install: Right-click on OpenIV.exe and select: "run as administrator".

===========================================================
Manual Installation:

You can open the *.oiv installer with a zip tool (eg 7-Zip) to extract its content
========================================================================================
========================================================================================
========================================================================================
Deactivating mods in order to play GTA Online:

-Launch "OpenIV" and navigate to "Tools/Asi Manager". Deactivate both "Asi Loader" and "OpenIV.asi"
  This will prevent the game from loading scripts and modified archives.

==========================================================
Uninstalling 'Realistic Driving' mod:

Three ways to remove this mod:
-Rename the "update.rpf" file in the "mods\update" folder. This is a quick way to deactivate/activate mods.
  (eg rename "update.rpf" to "update_mod.rpf". In order to re-activate: change file name back to "update.rpf")
-Delete "update.rpf" in the "mods\update" folder. (may remove/break other mods)
-Uninstaller. Run this mod's "uninstall.oiv" file with OpenIV.
  (replaces this mod's files with the game's default settings. keeps other mods intact.) 

===================================================================================
===================================================================================
IMPORTANT MODS TO ENHANCE EXPERIENCE:

----------------------------------------------------------
Unlocking your DLC vehicles in Singleplayer:

Rockstar has decided to disable DLC content in singleplayer and take away your cars. 
Two steps are neccessary to get them back:

-install "MP vehicles in SP" mod to disable de-spawning of your DLC cars: ( www.gta5-mods.com/scripts/mp-vehicles-in-sp )
-then use a trainer to spawn your DLC vehicles!

----------------------------------------------------------
Workaround for Rockstar's throttle cutting:

ikt's "InversePower" mod helps to reduce throttle cutting and get more realistic power oversteer.
Recommended mod for anyone who likes oversteer and wheelspin.
-download and install "InversePower"  ( www.gta5-mods.com/scripts/inversepower )
-open InversePower.ini in your game folder and change settings to:

[CONFIG]
Power = 105
Torque = 310
Angle = 25
Speed = 100
Slope = 150
Deadzone = 2.1

More realistic power oversteer (analog throttle only!):
[CONFIG]
Power = 80
Torque = 1050
Angle = 25
Speed = 100
Slope = 150
Deadzone = 1.8

Note: InversePower stops working for each car you upgrade using Simple Trainer or Menyoo, until you restart the game.
workarounds:
-use garage instead of trainer to install upgrades
-modify car with trainer, save game, quit, restart game
-save your favorite car configurations to file (trainer function). Loading complete car setups does not break InversePower. 

---------------------------------------------------------
Getting a speedometer

Recommended speedometers:
-NFS Gauge by XMOD (Analog and digital. skin 3 is digital. problems with re-sizing)
  ( www.gta5-mods.com/scripts/nfsgauge-rpm-gear-speedometer )

-Speedometer by LeFix (Analog speedometer. Alpha, size and scale can be customized. Scale is non-linear)
  ( www.gta5-mods.com/scripts/speedometer-improvedalexbladeversion )

-Speedometer by phk (Small digital readout. no visual customization)
  ( www.gta5-mods.com/scripts/complete-speedometer )

---------------------------------------------------------
Use a trainer to spawn and repair cars

Recommended:
-Native Trainer (by Alexander Blade)
   ( www.gta5-mods.com/tools/script-hook-v )

-Simple Trainer 5.0 (by sjaak327)
   ( www.gta5-mods.com/scripts/simple-trainer-for-gtav )

-Menyoo (by MAFINS)
   ( www.gta5-mods.com/scripts/menyoo-pc-sp )

---------------------------------------------------------
Recommended visual mods (low effect on performance):

-VisualV (Makes the game prettier. Lighting, shading, weather...)
   ( www.gta5-mods.com/misc/visualv )
-L.A. Roads (improved textures)
   ( www.gta5-mods.com/misc/l-a-roads-oiv-open-iv-package-installer )
-L.A. Roads Patch
   ( www.gta5-mods.com/misc/l-a-roads-patch )

======================================================================
======================================================================
INGAME

First steps in the modified game:

-pick a slow car, preferably one with Front-Wheel-Drive or All-Wheel-Drive
-avoid supercars with Rear-Wheel-Drive
-USE THE BRAKES! Cars have them for a reason.

----------------------------------------------------------
First person driving camera issues:

In order to fix camera wobble, go to GTAV's camera settings and set "First Person Vehicle Auto-Center" to "off".

----------------------------------------------------------
Car upgrades (car shop):

Stock engine results in performance equal to real life counterpart. increase power at your own risk.
Avoid lowering suspension.

----------------------------------------------------------
Story mission compatibility:

This mod was created for FREE ROAM. It might not work with some of the singleplayer missions.
Use 'Scaled Topspeed' version for best compatibility.

=======================================================================
=======================================================================
Troubleshooting:

Remove other mods from the game before installing this mod. This makes troubleshooting much easier.
You can add other mods AFTER successfully installing this mod.

Problem: Installer fails to install mod
Answer:  Right-click on OpenIV.exe and select: "run as administrator"

Problem: The game crashes to desktop while loading
Answer 1: You are running an outdated version of the game. Update your game.
	  If your game version is 1.36 or 1.41 you can use the alternative installers for 1.36/1.41 instead
Answer 2: There is a chance that OpenIV 2.8 has corrupted the "update.rpf" archive. 
          Remove "update.rpf" from the "mods\update" folder and run the installer a second time.

Problem: The game downloads files after i install this mod
Answer:  You have probably modified the wrong file. take another look at the instructions.
	 Other possible causes: A new game update might interfere with mods.

Problem: The "RDE 3.0" mod crashes.
Answer: Go to the RDE mod page and download the alternative gameconfig.xml file pinned at the top.

Problem: Driving physics of my vehicle dont feel right.
Answer:  Cars take handling damage in every single collision, even when there is no visible damage. Make sure that your vehicle is in pristine condition.
	 Other causes: GTA physics engine cannot handle low framerates. Make sure to have a steady framerate of 40+ fps, no micro-stutter.

===========================================================
Known problems (caused by Rockstar):

Bug 1: Police3 (Police Cruiser) physics are screwed up. Rockstar did this and there is nothing i can do about it. 
       Its hardcoded and ignores config files, only the idiots at Rockstar can fix this bug.

Bug 2: Some police cars previously driven by AI have broken driving physics and are missing ABS. This another one of Rockstar's screwups.

Bug 3: Steering of several lowrider cars is not rendered properly.

Wierd physics behavior (deliberately implemented by Rockstar):
       Many physics in this game (mostly AI cars) are calculated at 2 frames per second instead of 30 frames per second.
       This is an "optimization" that was introduced because of consoles. 
       It causes a lot of physics issues and wierd collisions. So thank our masters, the consoles, for these 'optimizations'!

==========================================================
Limitations imposed by the game:

GTA V forces the following limitations on this mod:
-over-sensitive steering (max steering is reached in only 0.200 seconds!)
-automated counter-steering
-automated throttle-cutting
-automated stability control
-automated flipping of the vehicle
-artificial limitation of pitch/roll angle
-retarded AI ( significantly limits changes to driving physics)

==========================================================
Special thanks to:

-The OpenIV team for providing rpf loader and installer
-Alexander Blade for scripthook
-ikt for scripting and creating additional tools
-PhK, LeFix, and XMOD for speedometers
