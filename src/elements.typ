#import "colors.typ": *

#let big-heading(title) = context {
    set par(justify: false)
    set text(hyphenate: false)

    let c = get-colors()
    pad(bottom: 0.25cm,
        align(center,
            text(fill: c.primary,
                size: 1.75em,
                strong(title))))
}

#let unbreak(body) = {
    set text(hyphenate: false)
    body
}

#let important-box(body,
    title: none,
    time: none,
    primary-color: magenta,
    secondary-color: magenta.lighten(90%),
    tertiary-color: magenta,
    dotted: false,
    counter: none,
    show-numbering: false,
    numbering-format: (..n) => numbering("1.1", ..n),
    figured: false) = {

    if show-numbering or figured {
        if counter == none {
            panic("parameter 'counter' must be set!")
        }

        counter.step()
    }

    set par(justify: true)
    // show: align.with(left)

    block(width: 100%,
        inset: 1em,
        fill: secondary-color,

        stroke: (left: (thickness: 5pt,
            paint: primary-color,
            dash: if dotted { "dotted" } else { "solid" })),

        {
            block(sticky: true, {
                set text(size: 0.75em, fill: tertiary-color)
                show: strong

                title

                if show-numbering or figured {
                    [ ] + context numbering(numbering-format, ..counter.at(here()))
                }

                h(1fr)
                time
            })

            block(body)
        })
}

#let standard-box-translations = (
    "task": [Task],
    "hint": [Hint],
    "solution": [Suggested solution],
    "definition": [Definition],
    "notice": [Notice!],
    "example": [Example],
)

#let wrap-figure(kind, supplement, counter, body) = {
    figure(kind: kind, supplement: supplement, align(left, body))
}

#let wrap-figure-if(kind, supplement, counter, body, figured) = {
    if figured {
        wrap-figure(kind, supplement, counter, body)
    } else {
        body
    }
}

#let task(..args,
    title: context state("grape-suite-box-translations", standard-box-translations).final().at("task"),
    element-counter: counter("grape-suite-element-task")
) = {
    wrap-figure-if("task", title, element-counter, context {
        let c = get-colors()
        important-box(
            title: title,
            primary-color: c.accent,
            secondary-color: c.accent-lighter,
            tertiary-color: c.primary,
            counter: element-counter,
            ..args
        )
    }, args.named().at("figured", default: false))
}

#let hint(..args,
    title: context state("grape-suite-box-translations", standard-box-translations).final().at("hint"),
    element-counter: counter("grape-suite-element-hint")
) = context {
    wrap-figure-if("hint", title, element-counter, context {
        let c = get-colors()
        important-box(
            title: title,
            primary-color: c.warning,
            secondary-color: c.warning-light,
            tertiary-color: c.warning-dark,
            counter: element-counter,
            ..args
        )
    }, args.named().at("figured", default: false))
}

#let solution(..args,
    title: context state("grape-suite-box-translations", standard-box-translations).final().at("solution"),
    element-counter: counter("grape-suite-element-solution")
) = context {
    wrap-figure-if("solution", title, element-counter, context {
        let c = get-colors()
        important-box(
            title: title,
            primary-color: c.accent,
            secondary-color: c.accent-lighter,
            tertiary-color: c.primary,
            counter: element-counter,
            dotted: true,
            ..args
        )
    }, args.named().at("figured", default: false))
}

#let definition(..args,
    title: context state("grape-suite-box-translations", standard-box-translations).final().at("definition"),
    element-counter: counter("grape-suite-element-definition")
) = {
    wrap-figure-if("definition", title, element-counter, context {
        let c = get-colors()
        important-box(
            title: title,
            primary-color: c.highlight,
            secondary-color: c.highlight-light,
            tertiary-color: c.highlight,
            counter: element-counter,
            ..args
        )
    }, args.named().at("figured", default: false))
}

#let notice(..args,
    title: context state("grape-suite-box-translations", standard-box-translations).final().at("notice"),
    element-counter: counter("grape-suite-element-notice")
) = context {
    wrap-figure-if("notice", title, element-counter, context {
        let c = get-colors()
        important-box(
            title: title,
            primary-color: c.highlight,
            secondary-color: c.highlight-light,
            tertiary-color: c.highlight,
            counter: element-counter,
            dotted: true,
            ..args
        )
    }, args.named().at("figured", default: false))
}

#let example(..args,
    title: context state("grape-suite-box-translations", standard-box-translations).final().at("example"),
    element-counter: counter("grape-suite-element-example")
) = context {
    wrap-figure-if("example", title, element-counter, context {
        let c = get-colors()
        important-box(
            title: title,
            primary-color: c.warning,
            secondary-color: c.warning-light,
            tertiary-color: c.warning-dark,
            counter: element-counter,
            dotted: true,
            ..args
        )
    }, args.named().at("figured", default: false))
}

#let sentence-logic(body) = {
    show figure.where(kind: "example"): it => {
        show: pad.with(0.25em)

        grid(columns: (1cm, 1fr),
            column-gutter: 0.5em,
            context [(#(counter("grape-suite-sentence-counter").at(here()).first()+1))],
            it.body)
    }

    body
}

#let sentence(body) = {
    figure(kind: "example", supplement: context state("grape-suite-element-sentence-supplement", "Example").final(), align(left, body) +
    counter("grape-suite-sentence-counter").step())
}

#let format-heading-numbering(body) = {
    show heading: it => context {
        let num-style = it.numbering

        if num-style == none {
            return it
        }

        let c = get-colors()
        let num = text(weight: "thin", numbering(num-style, ..counter(heading).at(here()))+[ \u{200b}])
        let x-offset = -1 * measure(num).width

        pad(left: x-offset, par(hanging-indent: -1 * x-offset, text(fill: c.primary-light, num) + [] + text(fill: c.primary, it.body)))
    }

    body
}

#let format-quotes(body) = {
    set quote(block: true)

    show quote.where(block: true): set par(spacing: 0.65em)
    show quote.where(block: true): set block(above: 0.65em, below: 0.65em)

    show quote.where(block: true): it => {
        block[
            #set text(size: 0.9em)
            #set par(leading: 0.65em)
            #it.body\
        ]

        block(text(size: 0.75em, (it.attribution)))
    }

    show quote.where(block: true): pad.with(left: 1.5em, y: 0.65em, rest: 0em)

    show quote.where(block: false): it => {
        ["] + h(0pt, weak: true) + it.body + h(0pt, weak: true) + ["]
        if it.attribution != none [#footnote(it.attribution)]
    }

    body
}

#let blockquote(body, source) = quote(body, attribution: source)