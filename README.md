# Tower Defense Roguelike

A 2D pixel art tower defense roguelike, built on a custom C++ engine.

## Requirements

- CMake 3.28+
- Ninja
- A C++23 compiler: GCC 14+, Clang 18+ or MSVC (Visual Studio 2022)
- Git

On Linux, SDL3 is built from source and needs the usual system headers (X11, Wayland, xkbcommon, libdecor, ALSA, PulseAudio/PipeWire).

### Dependency cache (recommended)

Dependencies are fetched by CPM. Set a cache so they are downloaded only once.

bash / zsh:
```bash
export CPM_SOURCE_CACHE="$HOME/.cache/CPM"
```

fish:
```fish
set -Ux CPM_SOURCE_CACHE $HOME/.cache/CPM
```

## Build and run

List the presets available on your machine:
```bash
cmake --list-presets
```

Linux (Clang, debug):
```bash
cmake --preset linux-clang-debug
cmake --build --preset linux-clang-debug
./build/linux-clang-debug/game/game
```

Linux (GCC): use `linux-gcc-debug` or `linux-gcc-release`.

Windows (from a Developer PowerShell for VS 2022):
```powershell
cmake --preset windows-msvc-debug
cmake --build --preset windows-msvc-debug
.\build\windows-msvc-debug\game\game.exe
```

## Tests

```bash
ctest --preset linux-clang-debug
```

## Dependencies

All dependencies are fetched automatically by [CPM.cmake](https://github.com/cpm-cmake/CPM.cmake) at configure time. Versions are pinned in `cmake/Dependencies.cmake`.

| Library | Version | Purpose |
|---|---|---|
| [SDL3](https://github.com/libsdl-org/SDL) | 3.4.20 | Window, input, rendering |
| [EnTT](https://github.com/skypjack/entt) | 4.0.0 | Entity Component System |
| [glaze](https://github.com/stephenberry/glaze) | 9.1.0 | JSON (game data, saves) |
| [Lua](https://github.com/lua/lua) | 5.4 | Scripting language for game content |
| [sol2](https://github.com/ThePhD/sol2) | 3.5.0 | C++ / Lua bindings |
| [miniaudio](https://github.com/mackron/miniaudio) | 0.11.26 | Audio |
| [spdlog](https://github.com/gabime/spdlog) | 1.17.0 | Logging |
| [doctest](https://github.com/doctest/doctest) | 2.5.3 | Unit tests |

## Project structure

```
engine/   Engine library (never depends on game/)
game/     Game executable, links engine
tests/    Unit tests (doctest)
assets/   Game data, Lua scripts, textures, sounds
cmake/    CMake modules and dependencies
```
