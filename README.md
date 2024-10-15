# Sugary Spire UNHAM Decompilation
 A Work-in-Progress Decompilation for the Sugary Spire UNHAM Mod (Crunchy Update)

This Decomp is not finished, but is Playable, and there are only small issues left

GameMaker Version Used: 2023.8

## Current Progress
Game does load, and it is very Playable, but can be laggy

Things I have Done:
- Added Enums for Player States, Enemy States, Confetti States, and even Menus
- Removed duplicated room code
- Fixed any Variables used as Functions, as UTMT does not support decompiling those
- Fixed any scripts that failed to decompile or caused memory leaks/crashes, using an unofficial build of UTMT that uses UnderAnalyzer instead of GML Decompiler
> Unofficial UTMT with UnderAnalyzer: https://nightly.link/UnderminersTeam/UndertaleModTool/actions/artifacts/1814233921.zip

## Issues
- scr_player_backtohub (Failing to finish a Level) animation is broken
- Decomp is currently not organized

### Other Shit
- Issues are described in more detail within the project notes
- And I added a Feature that Unlocks Pizzano by pressing ALT in Main Menu, so yeah...

### Thanks to
- QuantumV, for his decompiler
- zyledev, for his Playtest 3.2 Decompilation, which I have used as a base
- The Sugary Spire Developers, for making Sugary Spire
- The UNHAM Mod Developers, for adding new improvements and features to Sugary Spire

Note that none of the people mentioned above know me/know I even made this decomp
> they probably would also probably hate me if they knew I existed
