#import "../src/slides.typ": slides, slide, focus-slide

#set text(lang: "GB")

#show: slides.with(
    no: 7,
    series: [Systems Security Colloquium],
    title: [Policy-Driven Access Control],
    topics: ([Motivation], [Architecture], [Threat Model], [Conclusions]),

    head-replacement: none,
    title-replacement: none,
    footer: none,

    author: [Legacy Single Author],
    authors: (
        (name: "Alex Rowan", email: "alex.rowan@example.edu"),
        (name: "Samira Hale", email: "samira.hale@example.edu"),
    ),
    email: "legacy.author@example.edu",

    page-numbering: (n, total) => {
        text(size: 0.75em, strong[#n.first()])
        text(size: 0.5em, [ \/ #total.first()])
    },

    show-title-slide: true,
    show-author: true,
    show-semester: true,
    show-date: true,
    show-outline: true,
    show-todolist: false,
    show-footer: true,
    show-page-numbers: true,

    box-task-title: [Task],
    box-hint-title: [Hint],
    box-solution-title: [Solution],
    box-definition-title: [Definition],
    box-notice-title: [Notice],
    box-example-title: [Example],
    sentence-supplement: [Example],

    outline-title-text: [Outline],
    outline-depth: 2,
    heading-numbering: none,

    fontsize: 24pt,
    text-font: ("Atkinson Hyperlegible",),
    math-font: ("New Computer Modern Math",),

    date: datetime(year: 2026, month: 2, day: 19),
    date-format: (d) => if type(d) == type(datetime.today()) {
        [#d.display("[month repr:short] [day], [year]")]
    } else {
        d
    },
)

#slide[
    = Why This Matters
    Authorization bugs often appear when policy and implementation drift over time.
]

#slide[
    = Model
    - Inputs are untrusted.
    - Policy decisions are centralized.
    - Enforcement is explicit at each boundary.
]

#focus-slide[
    Defense-in-depth beats single-point trust.
]
