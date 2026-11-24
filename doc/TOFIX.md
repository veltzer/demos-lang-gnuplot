# TOFIX

Findings from a code scan on 2026-10-04.

## Medium

- `rsconstruct.toml` - nothing in the build touches `src/*.gnuplot`, so a broken demo script goes unnoticed. Add a `[processor.script]` (or equivalent) that runs each script headless, e.g. `gnuplot -e "set terminal dumb"` - which requires the interactive `pause -1` (`src/code_and_data_together.gnuplot:6`) to be guarded, e.g. `if (GPVAL_TERM ne "dumb") pause -1`.

## Low

- `src/code_and_data_together.gnuplot:1-4` - every line of the datablock, including the `EOD` terminator, ends in two trailing spaces, violating the fleet `.editorconfig` (`trim_trailing_whitespace = true`); strip them.
- `README.md:3` - only says how to run "the gnuplot scripts"; it does not name the single demo or what it shows (inline `$DATABLOCK` data plotted `with labels`). Add one line per script.
- `config/project.lua` - not linted: no `[processor.luacheck]` with `src_dirs = ["config"]` and no fleet `.luacheckrc`, unlike the 109 fleet repos that have both.
