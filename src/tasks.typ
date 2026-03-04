#import "colors.typ" as colors: *


#import "elements.typ" as elements: *

#let nobreak(body) = block(breakable: false, body)
#let center-block(body) = align(center, block(align(left, body)))

#let make-element(no, title, instruction, body,  points, lines, element-type) = {
  let title = if title != none [ --- #title] + h(1fr) + if points > 0 [#points P.]
  block(inset: 7pt,
  stroke: (bottom: (paint: purple, dash: "dashed")),
  fill: blue.lighten(75%), {

    text(fill: purple, strong[#element-type #no] + title)
  })

  block(width: 100%, {
    state("grape-suite-subtask-indent").update((0,))

    if instruction != none and instruction not in ([], [ ]) {
      block(instruction)
    }

    state("grape-suite-subtask-indent").update((0,))

    if body != none and body not in ([], [ ]) { block(body) }

    context {
      if state("grape-suite-show-lines").at(here()) == false {
        return
      }

      for i in range(0, lines) {
        v(0.75cm)
        v(-1.2em)
        line(length: 100%, stroke: black.lighten(50%))
      }
    }
  })
  v(0.5cm)
}

#let make-matrix-row(show-comment-field: false,
    comment-field-value: none,
    no,
    title,
    extra,
    points,
    solution-parts,
    task-type,
    extra-task-type) = {
    assert(solution-parts == none or points == solution-parts.fold(0, (sum, s) => sum + s.at(0)), message: "solution parts should have the same number of points as the whole task! (task no " + str(no) + ")")
    if (solution-parts == none ) {
      solution-parts = ()
    }
    let e = (
        table.hline(stroke: purple),

        table.cell(fill: blue.lighten(75%),
            strong(if extra [#extra-task-type ] else [#task-type ]) +
            strong(no) + if title != none [ --- #title]),

        table.cell(fill: blue.lighten(75%),
            align(center, strong[#box(line(length: 0.75cm)) / #points])),

        table.hline(stroke: purple),
        ..solution-parts.map(s => (
            s.at(1),
            align(center, box(line(length: 0.75cm)) + [ \/ #s.at(0)]),
        )).intersperse(
        table.hline(stroke: (paint: purple, dash: "dashed")),
      ).flatten()
    )

    if show-comment-field {
        e.push(table.cell(colspan: 2, comment-field-value))
    }

    return e
}

#let make-solution-matrix(
    show-comment-field: false,
    comment-field-value: none,
    loc,
    matrix-task-header,
    task-type,
    extra-task-type,
    achieved-points
) = {
    let tasks = state("grape-suite-tasks").at(loc)

    if tasks == none {
        return
    }
    let (extra-tasks, non-extra-tasks) = tasks
        .filter(t => t.points > 0 and not t.ignore-points)
        .fold(((), ()), (acc, t) => {
          acc.at(if t.extra { 0 } else { 1 }).push(t)
          acc
        })
    table(
        columns: (1fr, 3cm),
        stroke: none,
        inset: (x: 1em, y: 0.75em),

        table.cell(fill: purple, text(fill: white,
            align(horizon, strong(matrix-task-header)))),

        table.vline(stroke: purple),

        table.cell(fill: purple, text(fill: white,
            align(center, strong(achieved-points)))),

        ..non-extra-tasks.map(task => {
                make-matrix-row(show-comment-field: show-comment-field,
                    comment-field-value: comment-field-value,
                    task.no,
                    task.title,
                    task.extra,
                    task.points,
                    task.solution-parts,
                    task.task-type,
                    task.extra-task-type)}).flatten(),

        table.cell(colspan: 2, fill: purple, v(-10pt)),

         ..extra-tasks.map(task => {
                 make-matrix-row(show-comment-field: show-comment-field,
                     comment-field-value: comment-field-value,
                     task.no,
                     task.title,
                     task.extra,
                     task.points,
                     task.solution-parts,
                     task-type,
                     extra-task-type)}).flatten(),

          ..(if extra-tasks.len() > 0 { (table.cell(colspan: 2, fill: purple, v(-10pt)),) } else { () }).flatten(),

        [], [
            #show: align.with(center)

            #box(line(length: 0.75cm)) /
            #tasks.filter(e => not e.extra and not e.ignore-points).map(e => e.points).sum(default: 0) + #tasks.filter(e => e.extra and not e.ignore-points).map(e => e.points).sum(default: 0) P.

            #v(-0.5em)
            #line(length: 100%)
            #v(-1em)
            #line(length: 100%)
        ]
    )
}

#let make-point-distribution(loc,
    message,
    grade-scale,

    header-point-value,
    header-point-grade
) = {
    let points = state("grape-suite-tasks").at(loc)
    let points-sum = points.filter(e => not e.extra and not e.ignore-points).map(e => e.points).sum(default: 0)
    let extrapoints-sum = points.filter(e => e.extra and not e.ignore-points).map(e => e.points).sum(default: 0)
    let points-sum-all = points-sum + extrapoints-sum

    if points-sum-all > 0 {
        v(1fr)
        set text(fill: purple)
        block(fill: blue.lighten(75%),
            breakable: false,
            stroke: purple,
            inset: 1em,
            width: 100%, {

            message(points-sum, extrapoints-sum)

            let f(from, to) = {
                from = calc.round(from)
                to = calc.round(to)

                if from == to [#from] else [#from -- #to]
            }

            /*
            let n = 3

            let top-socket = points-sum * 0.9
            let bottom-socket = points-sum * 0.5

            let point-distribution = (f(points-sum, top-socket),)
            let last-to = top-socket

            for i in range(0, n) {
                let to = calc.min(last-to - 1, top-socket - (top-socket - bottom-socket) / n * (i + 1))

                point-distribution.push(f(last-to - 1, to))
                last-to = to
            }

            point-distribution.push(f(last-to - 1, 0))
            */

            let grade-scale = grade-scale.map(e => {
                e.at(1) = calc.floor(e.at(1)*points-sum)
                e
            }).enumerate()

            center-block(table(
                columns: grade-scale.len() + 1,
                stroke: none,
                align: center,

                strong(header-point-value), ..grade-scale.map(e => {
                    let (index, (_, p)) = e

                    let last-to = if index > 0 {
                        grade-scale.at(index - 1).last().last() - 1
                    } else {
                        points-sum
                    }

                    let to = calc.min(last-to, p)

                    if index + 1 >= grade-scale.len() {
                        to = 0
                    }

                    if last-to == to [#to] else [#last-to#[--]#to]
                }),

                table.hline(stroke: 1pt + purple),

                strong(header-point-grade),
                ..grade-scale
                    .rev()
                    .map(e => (table.vline(stroke: 1pt + purple), text(size: 0.95em, e.at(1).first())))
                    .rev()
                    .flatten(),
            ))
        })
    }
}

#let task(
    // number of lines to draw if show-lines of exercise-template is enabled
    lines: 0,

    // number of points, subtask points will be added
    points: 0,

    // is extra task?
    extra: false,

    // iff true, ignore points in final sum and solution matrix
    ignore-points: false,

    // description of points awarded for the task: list of tuples of (point_number, description)
    solution-parts: none,

    // numbering of task
    numbering-format: none,

    // formatting of task title
    instruction-format: none,

    // formatting of task instruction - default: emph
    title-format: none,
    // type of task
    type: none,

    // Title of the task
    title,

    // Instructions for the task
    instruction,

    // optional: body
    ..body,
    ) = counter(if extra { "tasks" } else { "extra-tasks" }).step() + context {

    let task-translation-state = state("grape-suite-task-translations", (task-type: [Task], extra-task-type: [Extra task]))
    let task-type = task-translation-state.final().task-type
    let extra-task-type = task-translation-state.final().extra-task-type

    let numbering-format = numbering-format
    if numbering-format == none {
        numbering-format = (..c) => numbering(if extra { "1" } else { "A" }, ..c)
    }
    let title-format = title-format
    if title-format == none {
      title-format = it => it
    }

    let instruction-format = instruction-format
    if instruction-format == none {
      instruction-format = emph
    }

    let no = numbering-format(..counter(if extra { "tasks" } else { "extra-tasks" }).at(here()))

    let t = (
        no: no,
        title: title-format(title),
        instruction: instruction-format(instruction),
        body: body.at(0, default: none),
        solution-parts: solution-parts,
        points: points,
        extra: extra,
        ignore-points: ignore-points,
        extra-task-type: if type != none {type} else {extra-task-type},
        task-type: if type != none {type} else {task-type}
    )

    if t.body == [] or t.body == [ ] {
        t.body = none
    }

    state("grape-suite-tasks", ()).update(k => {
        k.push(t)
        return k
    })

    state("grape-suite-subtask-indent").update((0,))

    context make-element(no,
        t.title,
        t.instruction,
        t.body,
        t.points,
        lines,
        if type != none {type} else if t.extra {extra-task-type} else {task-type},
      )
}

#let subtask(points: 0,
    tight: false,
    ignore-points: false,
    markers: ("1.", "a)"),
    show-points: true,
    counter: none,
    content) = {

    if points != none and type(points) == int and not ignore-points {
        state("grape-suite-tasks", ()).update(k => {
            if k.len() == 0 {
                return k
            }

            let li = k.len() - 1
            let e = k.at(li)

            e.points += points

            k.at(li) = e
            return k
        })
    }

    state("grape-suite-subtask-indent", (0,)).update(k => {
        k.push(0)
        k
    })

    context {
        let indent = state("grape-suite-subtask-indent").at(here())

        let num = if counter == none {
            indent.at(indent.len() - 2) + 1
        } else {
            counter
        }

        let marker = if indent.len() - 2 >= markers.len() {
            "i."
        } else {
            markers.at(indent.len() - 2)
        }

        if not tight {
            v(0.25em)
        }

        grid(columns: (2em, 1fr), column-gutter: 0.75em, {
            set align(right)
            numbering(marker, num)
        }, if points != none and points > 0 and show-points {
            metadata((type: "grape-suite-subtask-points", content: block(width: 7%, [#points P.])))
            content
        } else {
            content
        })

        if not tight {
            v(0.25em)
        }
    }

    state("grape-suite-subtask-indent", (0,)).update(k => {
        k = k.slice(0, k.len() - 1)

        if k.len() > 0 {
            k.last() = k.last() + 1
        }

        k
    })
}

#let hint(body) = {
  state("grape-suite-subtask-indent").update((0,))
  let content = elements.hint(body);
  content
};

#let solution( body) = {
  state("grape-suite-subtask-indent").update((0,))
  let content = elements.solution(body)
  content
}
