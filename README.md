# gameoflife

![gol_image](https://i.imgur.com/NApBYac.gif)

## Description
This is a simulation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) written in verilog.

The simulation consists of a 2D array of 1-bit registers, each representing the state of a cell (whether it is alive or dead). The C++ frontend then reads these registers and displays them as a 2D grid using [raylib](https://www.raylib.com/)

## Dependencies
You will need to install [verilator](https://verilator.org/guide/latest/install.html#detailed-build-instructions) and [raylib](https://github.com/raysan5/raylib#build-and-installation) to build the project successfully. You can install them from your system package manager if they are available, or build them from source by following the links.

## How to use
Run `make run` to build and run the project.

The simulation starts in the edit phase, where you can use the left and right mouse buttons to change the state of any cell. Pressing the space key will start playing the simulation.

At any point, you can press the space key again to pause the simulation and edit the states of all the cells as you wish. Hit space to continue playing the simulation.

#### Sriprad Potukuchi
