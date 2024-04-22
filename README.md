# IZLO – Project 2: SMT solver

## Author

- **Name:** Maksim Kalutski
- **Login:** xkalut00

## Project Overview

This project involves analyzing a specific function `f` implemented in C-like language using an SMT (Satisfiability
Modulo Theories) solver. The goal is to find the smallest possible sum of parameters `D` and `E` such that the
function `f` returns `true`.

## Function Description

The function `f` takes five integer parameters (`A`, `B`, `C`, `D`, `E`) and computes a series of conditional operations
based on these inputs. The key requirements are:

- `D` and `E` must be positive integers.
- The function should return `true` under specific arithmetic conditions based on `A`, `B`, `C`, `D`, and `E`.

## SMT Formulation

The task is to convert the function logic into an SMT formula that allows the SMT solver to verify the conditions under
which the function returns `true` and determine the minimal value for `D+E`.

### Core Logic

1. Declare integer variables for `A`, `B`, `C`, `D`, `E`.
2. Define the formula based on the branching logic and arithmetic operations specified in the function.
3. Ensure that `D` and `E` are positive and their sum is minimized while still satisfying the function's conditions.

### Testing

The project includes a testing framework where various inputs are fed into the solver to verify the correctness and
efficiency of the SMT formula. Each test checks if:

- The solution is satisfiable (`sat`) with the given inputs.
- There is no smaller sum of `D + E` that still satisfies the conditions (`unsat` for alternative sums).

## Usage

To run the SMT solver on this project, follow these steps:

1. Ensure you have an SMT solver like Z3 or CVC4 installed.
2. Place the SMT script in the solver environment.
3. Execute the script to observe the behavior of the function under different input scenarios.

