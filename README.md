# Doom 2D Forever
Doom 2D: Forever is a modern version of a Russian freeware doom game Doom 2D.

# Build
Requirements:
- FPC >= 3.0.4
- libenet >= 1.3.13

```
  git clone --recurse-submodules https://github.com/Challenge9/doom2d-forever
  cd doom2d-forever
  mkdir -p ./build/bin ./build/tmp
  bash script/game/download_game.sh ./build/
  cd src/game
  fpc -B -dUSE_SDLMIXER -FE../../build/bin -FU../../build/tmp Doom2DF.lpr
```

Windows binaries will require the appropriate DLLs (SDL2.dll, SDL2_mixer.dll or
FMODEx.dll, ENet.dll, miniupnpc.dll), unless you choose to static link them.

*Important* Remember to clear the cache directory (`build/tmp` by default) after you've built the game!

# Run
- If you've followed build instructions above, `../../build/bin/Doom2DF`
- If Doom2DF is installed in the system PATH, `Doom2DF`
