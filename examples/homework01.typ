#import "/src/library.typ": exercise
#import exercise: project, task, subtask, solution, hint

#let task = task.with(numbering-format: (..n) => numbering("1", ..n), instruction-format: strong )
#let subtask = subtask.with(markers: ("a)", "1)"))

#show: project.with(no: 1,
    type: "Aufgabenblatt",
    suffix-title: "Darstellungen des Pegasus in der antiken griechischen Literatur",
    show-hints: true,
    show-solutions: true,

    show-solutions-matrix: true,
    task-type: [Aufgabe],
    extra-task-type: [Zusatzaufgabe],

    solution-type: [Lösungsvorschlag],
    solutions-title: [Lösungsvorschläge],

    hint-type: [Hinweis],
    hints-title: [Hinweise],

    box-task-title: [Aufgabe],
    box-hint-title: [Hinweis],
    box-solution-title: [Lösung],

    university: [Universität Musterstadt],
    institute: [Historisches Institut],
    seminar: [Seminar: Antike Mythologie],

    date: datetime(year: 2024, month: 12, day: 31),
)

#task(points:  4, solution-parts: ((1,lorem(20)), (3, lorem(23)), (4, lorem(30))), [Pegasus in der Mythologie], none, [
    #subtask(points: 3)[
        Beschreiben Sie die Entstehungsgeschichte des Pegasus in der griechischen Mythologie. Gehen Sie dabei auf seine Herkunft und die wichtigsten Figuren ein, die mit ihm verbunden sind.
    ]

    #subtask(points: 1)[
        Analysieren Sie die Rolle des Pegasus im Mythos von Bellerophon. Welche Bedeutung hat Pegasus für den Verlauf und den Ausgang der Geschichte?
    ]
])

#solution[
    #subtask[
        #lorem(20)
    ]

    #subtask[
        #lorem(20)
    ]
]

#hint[
    #subtask(counter: 2)[
        #lorem(20)
    ]
]

#task(points: 5)[Pegasus in literarischen Quellen][
    Vergleichen Sie die Darstellung des Pegasus in zwei antiken griechischen Quellen (z.B. in Hesiods Theogonie und Pindars Oden). Gehen Sie auf Unterschiede und Gemeinsamkeiten in der Symbolik und Charakterisierung des Pegasus ein.
]

#task(points:  6, solution-parts: ((1,lorem(20)), (3, lorem(23)), (2, lorem(30))))[Pegasus als kulturelles Symbol][
    Diskutieren Sie die Bedeutung des Pegasus als Symbol in der antiken griechischen Kultur. Welche Werte oder Konzepte verkörpert er? Beziehen Sie sich dabei auch auf seine spätere Rezeption in Kunst und Literatur.
]

#solution[
    #lorem(50)
]