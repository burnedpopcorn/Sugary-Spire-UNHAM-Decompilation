# Sugary Spire UNHAM Decompilation
 A shitty Work-in-Progress Decompilation for the Sugary Spire UNHAM Mod (Crunchy Update)

THIS IS NOT FINISHED!

GameMaker Version Used: 2023.8

## Current Progress
Game does load, and you can get into the menu

Things I have Done:
- Added Enums for Player States, Enemy States, Confetti States, and basically anywhere that needed them
- Removed duplicated room code
- Fixed any Variables used as Functions, as UTMT does not support decompiling those
- Fixed any scripts that failed to decompile, using a unofficial build of UTMT that uses UnderAnalyizer instead of GML Decompiler

## Issues
- Player is stuck and can only teleport to the edges of screen in outer_room1 (Outside Tower Room)

that's all I can find, as this issue doesn't allow me to test further

> [!NOTE]
> Issues are described in more detail within the project notes
>
> And I added a Feature that Unlocks Pizzano by pressing ALT in Main Menu, so yeah...

### Other Shit
- Any Scripts or Objects that have Enemy States (baddiestates.xxxxx) within them are completely fucked

> Because my dumbass decided copy and pasting Playtest 3.2 code, and not saving old code was a good idea
>
> Yes, I'm stupid for doing that

> and this also might affect Confetti states... fuck

(This Issue is pretty bad, and needs to be corrected by decompiling the affected scripts)

## Massive Thanks to
- QuantumV, for his decompiler
- zyledev, for his Playtest 3.2 Decompilation, which I have used as a base

(Note that none of these people have ANY association with this decompilation, and don't even know I made it)