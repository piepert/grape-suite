#import "colors.typ": *

#let unbreak(body) = {
    set text(hyphenate: false)
    body
}

#let important-box(body,
    title: none,
    time: none,
    extra: false,
    primary-color: magenta,
    secondary-color: magenta.lighten(90%),
    tertiary-color: magenta,
    dotted: false,
    figured: false,
    counter: none,
    show-numbering: false,
    numbering-format: (..n) => numbering("1.1", ..n),
    figure-supplement: none,
    figure-kind: none) = {

    if figured {
        if figure-supplement == none {
            figure-supplement = title
        }

        if figure-kind == none {
            panic("once paramter 'figured' is true, parameter 'figure-kind' must be set!")
        }
    }


    let body = {
        if show-numbering or figured {
            if counter == none {
                panic("parameter 'counter' must be set!")
            }

            counter.step()
        }

        set par(justify: true)
        show: align.with(left)
        
        block(width: 100%,
            inset: 1em,
            fill: secondary-color,

            stroke: (left: (thickness: 5pt,
                paint: primary-color,
                dash: if dotted { "dotted" } else { "solid" })),


            text(size: 0.75em, strong(text(fill: tertiary-color, smallcaps(title) + if show-numbering or figured { [ ] + locate(loc => numbering(numbering-format, ..counter.at(loc))) + h(1fr) + time})))
            // + place(dx: 90%, dy: -0.5cm, text(size: 4em, fill: primary-color.lighten(75%), strong(extra)))
            + block(body))
    }

    if figured {
        figure(kind: figure-kind, supplement: figure-supplement, body)
    } else {
        body
    }
}

#let standard-box-translations = (
    "task": [Task],
    "hint": [Hint],
    "solution": [Suggested solution],
    "definition": [Definition],
    "notice": [Notice!],
    "example": [Example],
)

#let task = important-box.with(
    title: locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("task")),
    extra: [A],
    primary-color: blue,
    secondary-color: blue.lighten(90%),
    tertiary-color: purple,
    figure-kind: "task",
    counter: counter("grape-suite-element-task"))

#let hint = important-box.with(
    title: locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("hint")),
    extra: [H],
    primary-color: yellow,
    secondary-color: yellow.lighten(90%),
    tertiary-color: brown,
    figure-kind: "hint",
    counter: counter("grape-suite-element-hint"))

#let solution = important-box.with(
    title: locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("solution")),
    extra: [L],
    primary-color: blue,
    secondary-color: blue.lighten(90%),
    tertiary-color: purple,
    dotted: true,
    figure-kind: "solution",
    counter: counter("grape-suite-element-solution"))

#let definition = important-box.with(
    title: locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("definition")),
    extra: [D],
    primary-color: magenta,
    secondary-color: magenta.lighten(90%),
    tertiary-color: magenta,
    figure-kind: "definition",
    counter: counter("grape-suite-element-definition"))

#let notice = important-box.with(
    title: locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("notice")),
    extra: [!],
    primary-color: magenta,
    secondary-color: magenta.lighten(90%),
    tertiary-color: magenta,
    dotted: true,
    figure-kind: "notice",
    counter: counter("grape-suite-element-notice"))

#let example(body) = {
    important-box(locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("example")),
        body,
        [B],
        yellow,
        yellow.lighten(90%),
        brown,
        dotted: true)
}

#let blockquote(body, source) = pad(x: 1em, y: 0.25em, body + block(text(size: 0.75em, source)))

#let example(..a) = figure.with(kind: "example", a)