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
- obj_slope does not work as intended, as you can just walk through it
- Enemies that should only spawn Post Sugar Rush still load
- Cotton Power-Up doesn't harm any enemy other than the Chocolate Frog

### Other Shit
- Issues are described in more detail within the project notes
- And I added a Feature that Unlocks Pizzano by pressing ALT in Main Menu, so yeah...

## Massive Thanks to
- ygxa, for fixing player collisions and contributing to this decomp

### Also thanks to
- QuantumV, for his decompiler
- zyledev, for his Playtest 3.2 Decompilation, which I have used as a base
- The Sugary Spire Developers, for making Sugary Spire
- The UNHAM Mod Developers, for adding new improvements and features to Sugary Spire 
> they probably would hate me if they knew I existed

> [!IMPORTANT]
> I'm not gonna organize it within GameMaker
>
> Cry about it
>
> Literally just use GMS2 Search, its not hard

> even my fucking laptop built with an Intel Atom can handle it, so you can too
