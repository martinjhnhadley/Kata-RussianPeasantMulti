# NewOrbit Code Club: Kata Russian Peasant Multication
Weekly coding challenge - implementing a multiplication hack.

## Wolfram Language

KataMulti.wl includes a function `kataBasic` for calculating products via the Russian Peasant method, `kataFancy` visualises the technique and `kataExporter` exports a GIF of the technique. The solution is achieved through `NestWhileList`, and allows for negative integers. Note that this method was written first.

Load the package with

```
Needs["KataMulti`"]
```

KataMultiplicationExample.GIF is an example GIF exported from `kataExporter`.

![Kata GIF](https://raw.githubusercontent.com/martinjhnhadley/Kata-RussianPeasantMulti/master/KataMultiplicationExample.gif)

## R

RKataScript.R includes a function `kataBasic` for calculating products via the Russian Peasant method. The solution is achieved through a conditional `While` loop, note that this was written before investigating other R solutions.

## Python

KataPythonScript.py provides a function `kataBasic` for calculating products via the Russian Peasant method. This solution is simply a re-write of the R solution and was written before investigating other solutions.

## Non Scripting Languages

Note that any further implementations are inspired by others, having reviewed an efficient Python method that `+=` iteratively based on a // division.

