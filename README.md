# Sugary Spire UNHAM Decompilation
 A shitty Work-in-Progress Decompilation for the Sugary Spire UNHAM Mod (Crunchy Update)

THIS IS NOT FINISHED!

## Current Progress
Game does load, and you can get into the menu

Things I have Done:
- Added Enums for Player States, Enemy States, Confetti States, and basically anywhere that needed them
- Removed duplicated room code
- Fixed any Variables used as Functions, as UTMT does not support decompiling those
- Used Playtest 3.2 code to replace scripts (almost entirely player state scripts) that failed to decompile (UTMT issue again, and will NOT be a final solution)

## Issues
- Many Player States do not function correctly, and usually don't display or freezes the game (due to the last listed reason above)

that's all I can find, as player states issue doesn't allow me to test further

> [!NOTE]
> Issues are described in more detail within the project notes

## Massive Thanks to
- QuantumV, for his decompiler
- zyledev, for his Playtest 3.2 Decompilation, which I have used as a base

(Note that none of these people have ANY association with this decompilation, and don't even know I made it)