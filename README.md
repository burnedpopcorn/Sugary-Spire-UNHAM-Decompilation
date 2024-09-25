# Sugary Spire UNHAM Decompilation
 A shitty Work-in-Progress Decompilation for the Sugary Spire UNHAM Mod (Crunchy Update)

THIS IS NOT FINISHED!

GameMaker Version Used: 2023.8

## Current Progress
Game does load, and you can get into the Main Menu and even In Game (kinda)

Things I have Done:
- Added Enums for Player States, Enemy States, Confetti States, and basically anywhere that needed them
- Removed duplicated room code
- Fixed any Variables used as Functions, as UTMT does not support decompiling those
- Fixed any scripts that failed to decompile, using an unofficial build of UTMT that uses UnderAnalyzer instead of GML Decompiler
> Unofficial UTMT with UnderAnalyzer: https://nightly.link/UnderminersTeam/UndertaleModTool/actions/artifacts/1814233921.zip

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
- The Sugary Spire Developers, for making Sugary Spire
- The UNHAM Mod Developers, for adding new improvements and features to Sugary Spire 
> they probably would hate me if they knew I existed

(Note that none of these people have ANY association with this decompilation, and don't even know I made it)

> [!IMPORTANT]
> I'm not gonna organize it within GameMaker
>
> Cry about it
>
> Literally just use GMS2 Search, its not hard

> even my fucking laptop built with an Intel Atom can handle it, so you can too