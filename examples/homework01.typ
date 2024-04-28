#import "/src/library.typ": exercise
#import exercise: project, task, subtask

#let task = task.with(numbering-format: (..n) => numbering("1", ..n))
#let subtask = subtask.with(markers: ("a)", "1)"))

#show: project.with(no: 1,
    type: "Aufgabenblatt",
    suffix-title: "Betriebssysteme",

    show-solutions: true,
    show-hints: true,

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
    institute: [Institut für Informatik],
    seminar: [Vorlesung: Betriebssysteme]
)

#task[Verständnis von Betriebssystemkonzepten][
    #subtask[
        Beschreiben Sie die Rolle des Betriebssystems im Kontext eines Computersystems. Erläutern Sie die Unterschiede zwischen Batch-, Interaktiv- und Echtzeit-Betriebssystemen. Geben Sie Beispiele für Anwendungen, die jeweils von diesen Betriebssystemtypen profitieren.
    ]

    #subtask[
        Diskutieren Sie die Bedeutung von Prozesssynchronisation in einem Multitasking-Betriebssystem. Erklären Sie drei verschiedene Methoden zur Prozesssynchronisation und geben Sie jeweils Vor- und Nachteile an.
    ]
][][
    #subtask[
        #lorem(20)
    ]

    #subtask[
        #lorem(20)
    ]
][
    #subtask(counter: 2)[
        #lorem(20)
    ]
]

#task[Praktische Anwendung von Betriebssystemkonzepten][
    Implementieren Sie ein Programm in C, das die Verwendung von Semaphore zur Prozesssynchronisation demonstriert. Verwenden Sie das POSIX-Thread-Modell und implementieren Sie ein Szenario, in dem mehrere Threads auf gemeinsame Ressourcen zugreifen.
]

#task[Analyse von Betriebssystemleistung und -optimierung][
    Beschreiben Sie die Aufgaben des Betriebssystems bei der Verwaltung von Speicherressourcen. Erläutern Sie die Unterschiede zwischen physischem und virtuellem Speicher und diskutieren Sie die Methoden, die ein Betriebssystem zur Verwaltung dieser Speichertypen verwendet.
][][
    #lorem(50)
]