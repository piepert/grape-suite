#import "../src/exercise.typ": project, task, subtask

#set text(lang: "GB")

#show: project.with(
    no: 4,
    type: [Worksheet],
    title: [Secure Systems Practice Sheet],
    suffix-title: [Input Validation and Policy Checks],
    show-outline: true,
    abstract: [
        This is a complete example configuration for the `exercise.project` template
        with fake metadata and multi-author input.
    ],
    document-title: [Systems Security Worksheet],

    show-hints: false,
    show-solutions: false,

    show-namefield: true,
    namefield: none,
    show-timefield: true,
    timefield: (time) => [Time budget: #time min],
    max-time: 90,

    show-lines: true,
    show-point-distribution-in-tasks: true,
    show-point-distribution-in-solutions: false,

    solutions-as-matrix: false,
    show-solution-matrix-comment-field: false,
    solution-matrix-comment-field-value: [*Reviewer note:* #v(0.4cm)],

    university: [Northbridge Technical University],
    faculty: [Faculty of Applied Computing],
    institute: [Institute for Systems Engineering],
    seminar: [Secure Software Seminar],
    semester: [Spring 2026],
    docent: [Dr. Avery Morgan],

    author: [Legacy Single Author],
    authors: (
        (name: "Alex Rowan", email: "alex.rowan@example.edu"),
        (name: "Samira Hale", email: "samira.hale@example.edu"),
    ),

    date: datetime(year: 2026, month: 2, day: 19),
    date-format: (d) => if type(d) == type(datetime.today()) {
        d.display("[day].[month].[year]")
    } else {
        d
    },

    header: none,
    header-gutter: 18%,
    header-right: none,
    header-middle: none,
    header-left: none,
    show-header-line: true,

    footer: none,
    footer-right: none,
    footer-middle: none,
    footer-left: none,
    show-footer-line: true,

    task-type: [Task],
    extra-task-type: [Bonus task],
    box-task-title: [Task],
    box-hint-title: [Hint],
    box-solution-title: [Suggested solution],
    box-definition-title: [Definition],
    box-notice-title: [Notice],
    box-example-title: [Example],

    hint-type: [Hint],
    hints-title: [Hints],
    solution-type: [Suggested solution],
    solutions-title: [Suggested solutions],

    solution-matrix-task-header: [Task],
    solution-matrix-achieved-points-header: [Points],
    distribution-header-point-value: [Points],
    distribution-header-point-grade: [Grade],

    message: (points-sum, extrapoints-sum) => [
        Total available: #points-sum + #extrapoints-sum points.
    ],
    grade-scale: (
        ([excellent], 0.9),
        ([good], 0.75),
        ([pass], 0.6),
        ([fail], 0.49),
    ),

    page-margins: (top: 5.2cm, bottom: 2.8cm, left: 2.5cm, right: 2.5cm),
    text-font: ("Atkinson Hyperlegible",),
    math-font: ("New Computer Modern Math",),
    fontsize: 11pt,
    show-todolist: false,
)

= Multiple-Choice
#task(points: 4, [Input Validation], [
    Select the most robust validation strategy for untrusted input.
], [])

= Short Answer
#task(points: 6, lines: 4, [Authorization], [
    Explain why authorization checks should be performed server-side.
], [])

= Extra
#task(extra: true, points: 3, [Bonus], [
    Give one real-world example of policy drift.
], [])
