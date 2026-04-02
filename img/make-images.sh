#!/usr/bin/bash
# working directory should be img/ folder

# for the README.md only homework01, seminar-paper01, slides01, exam03, protocol01 and essay01 are needed

# homework01, page 1
typst c --root .. ../examples/homework01.typ  "./homework01-{0p}.png" --format png --pages 1
typst c --root .. ../examples/homework01.typ  "./homework01-{0p}-hints.png" --format png --pages 1 --input hints=true
typst c --root .. ../examples/homework01.typ  "./homework01-{0p}-solutions.png" --format png --pages 1 --input solutions=true

# essay01, pages 1-3
typst c --root .. ../examples/essay01.typ  "./essay01-{0p}.png" --format png --pages 1-3

# exam03
typst c --root .. ../examples/exam03.typ  "./exam03-{0p}.png" --format png --pages 1-2,5

# protocol01, pages 1-3
typst c --root .. ../examples/protocol01.typ  "./protocol01-{0p}.png" --format png --pages 1-3

# seminar-paper01, pages 1-3
typst c --root .. ../examples/seminar-paper01.typ  "./seminar-paper01-{0p}.png" --format png --pages 1-3

# slides01, pages 1-4,8,12
typst c --root .. ../examples/slides01.typ  "./slides01-{0p}.png" --format png --pages 1-4,8,12