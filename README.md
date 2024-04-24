# SystemVerilog Solutions for [Turing Complete](https://store.steampowered.com/app/1444480/Turing_Complete/)

(Work in Progress)

This repo contains my SystemVerilog solutions of each level of the game [Turing Complete](https://store.steampowered.com/app/1444480/Turing_Complete/), paired with testbenches.

## Overview

[Turing Complete]([Steam:](https://store.steampowered.com/app/1444480/Turing_Complete/)) challenges the player to build an ASIC with only wires and NAND gates[^1]. ASIC here means a combination of ALU, memory, PC counter, register files, and instruction set, which together form a machine that is Turing complete. 

[^1]: The same thing can also be done with only wires and NOR gates. Technically, the game also assumes a tristate buffer (a BIT SWITCH), which cannot be implemented by NAND or NOR because of the high impedence.

The game itself has nothing to do with SystemVerilog, given that the user can only drag gates around the screen and connect them with wires. 

This repo has the following aims:

1. To expose various structures of SystemVerilog and SystemVerilog assertions, and their usage in designing testbenches.
2. To showcase the usage of Perl, such as in generating SystemVerilog codes based on truth tables (e.g., [CountingSignals.pl](Scripts/CountingSignals.pl)).

## Project Structure

The codes are classified as follows:

1. `Design/`
2. `Testbench/`
2. `Scripts/`
3. `TruthTable/`

Each source code file has the same name of each level, e.g., `CrudeAwakening.sv` corresponds to the very first level *CRUDE AWAKENING* in [Turing Complete]([Steam:](https://store.steampowered.com/app/1444480/Turing_Complete/)).


## Limitations 

[Turing Complete]([Steam:](https://store.steampowered.com/app/1444480/Turing_Complete/)) lacks challenges for 

1. FIFO.
2. Integer/Floating point multipler/divisor.
3. Network communication.
4. Async design.

## Todo

- [ ] Design part for all levels.
- [ ] Testbench part for all levels.

## References

- [Digital Design and Computer Architecture: ARM Edition](https://a.co/d/hRg4Ugl)

