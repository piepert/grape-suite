#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/cetz:0.4.2"

#import "/src/library.typ": colors, slides
#import slides: *

#let tmagenta(body) = text(fill: colors.magenta, body)
#let tblue(body) = text(fill: colors.blue, body)

#let inference(..args) = {
    let args = args.pos()

    if args.len() < 2 {
        args = (none,) * (2 - args.len()) + args
    }

    set par(leading: 0.5em)
    stack(
        dir: ttb,
        spacing: 0.5em,
        ..args.slice(0, args.len() - 1),
        line(length: 100%),
        args.last(),
    )
}

#show: slides.with(
    series: [Logik-Tutorium],
    no: 2,
    title: [der Argumentbegriff und die Normalform],
    date: datetime(
        year: 2025,
        month: 10,
        day: 29,
    ),
    show-outline: false,

    box-hint-title: "Hinweis",
    box-task-title: "Aufgabe",
    box-notice-title: "Achtung",
    box-example-title: "Beispiel",
)

#focus-slide[
    Aussagesätze
]

#slide[
    = Erwärmung

    #definition[
        *Aussagesätze* sind Sätze, die entweder wahr oder falsch sein können.
    ]
]

#slide[
    = Erwärmung

    #task(time: [Plenum, 5 min.])[
        Entscheiden Sie, ob es sich um einen Aussagesatz handelt:
        + Heute findet kein Logik-Tutorium statt.
        + Warum sitzen wir dann hier?
        + Lasst uns an die frische Luft gehen!
        + $x$ ist heute auch dabei.
        + wahr
    ]
]

#focus-slide[
    Gute, gültige und schlüssige Argumente
]

#slide[
    = Was ist eigentlich ein "gutes" Argument?
    #set text(size: 0.95em)

    #example(inference[
        Fleisch liefert wichtige Vitamine.][
        Wir sollten alle Fleisch essen.])

    #task(time: [Plenum, 5 min.])[
        Bewerten Sie das Argument!
        // + Schlagen Sie eine Verbesserung vor!
    ]
]

#slide[
    = Methodisch: Das Gruppenpuzzle

    #figure(image("gruppenpuzzle.png", width: 65%))
]

#slide[
    = Arten von Argumenten

    #task(time: [Expertengruppen, 15 min.])[
        + Lesen Sie das Material.
        + Erarbeiten Sie eine Definition und eine kleine Beschreibung oder eine Probe für ihr jeweiliges Thema:
        #set enum(numbering: "M1:")
        + deduktive Gütligkeit
        + induktive/nicht-deduktive Gültigkeit
        + Schlüssigkeit
    ]
]

#slide[
    = Arten von Argumenten

    #set text(size: 0.9em)
    #task(time: [Stammgruppen, 15 min.])[
        Ordnen Sie in Ihren Stammgruppen die Argumente aus M4 mit Hilfe Ihrer Definitionen in das folgende Muster ein:
    ]

    #figure(diagram(
        spacing: 1em,
        node((0, 0), [Argument]),

        edge((0, 0), (-0.5, 1), "-|>"),
        node((-0.5, 1), [gültig]),

        edge((-0.5, 1), (0, 2), "-|>"),
        node((0, 2), [induktiv-gültig]),
        edge((-0.5, 1), (-1, 2), "-|>"),
        node((-1, 2), [deduktiv-gültig]),

        edge((-1, 2), (-1.5, 3), "-|>"),
        node((-1.5, 3), [schlüssig]),
        edge((-1, 2), (-0.5, 3), "-|>"),
        node((-0.5, 3), [nicht schlüssig]),

        edge((0, 0), (0.5, 1), "-|>"),
        node((0.5, 1), [ungültig]),
    ))
]

#slide[
    #set text(size: 0.9em)
    #notice[
        In allen folgenden Tutorien wird unter *Gültigkeit* die *deduktive Gültigkeit* verstanden.
    ]

    #notice[
        Wir bewerten Argumente anhand ihrer Gültigkeit und Schlüssigkeit. Möchte man ein Argument kritisieren, muss man eines dieser beiden anzweifeln und zeigen, dass es entweder nicht gültig oder nicht schlüssig ist.
    ]
]

#focus-slide[
    Normalform von Argumenten
]

#slide[
    #set text(size: 0.89em)
    #task(time: [PA, 5 min.])[
        Vergleichen Sie die folgenden Argumente in Hinsicht auf ihre Form!
    ]

    + Kein Mensch ist sterblich oder Fisch ist leicht verderblich. Es ist aber nicht so, dass kein Mensch sterblich ist. Also ist Fisch leicht verderblich.

    + Einstein hat Recht, denn Einstein oder Newton haben Recht. Und Newton hat nicht Recht.

    + Philosophie ist eine Geisteswissenschaft oder gar keine Wissenschaft. Philosophie ist keine Wissenschaft, denn eine richtige Geisteswissenschaft ist sie sicher nicht.
]

#slide[
    = Herstellen der Normalform
    #set text(size: 0.8125em)
    #show: columns.with(2)
    #hint[
        #set par(justify: false)
        Hinweiswörter für Konklusionen:
        - also, ergo, folglich, infolgedessen, demzufolge, somit
        - daher, deshalb, darum
        - aus ... folgt ...
        - aus ... lässt sich ableiten/ist zu schließen, dass ...
        - ... beweist/zeigt/rechtfertigt/impliziert, dass ...
    ]

    #hint[
        Hinweiswörter für Prämissen:
        - da
        - weil
        - denn
        - nämlich
        - aufgrund, infolge, wegen
    ]
]

#slide[
    = Herstellen der Normalform
    + Kein Mensch ist sterblich oder Fisch ist leicht verderblich. Es ist aber nicht so, dass kein Mensch sterblich ist. *Also* ist Fisch leicht verderblich.

    #hint[
        "also" ist das üblichste Wort, um logische Folgerung und die Konklusion zu anzuzeigen.
    ]

    // + Einstein hat Recht, *denn* Einstein oder Newton haben Recht. Und Newton hat nicht Recht.

    // + Philosophie ist eine Geisteswissenschaft oder gar keine Wissenschaft. Philosophie ist *daher* keine Wissenschaft, *weil* sie sicher keine richtige Geisteswissenschaft ist.
]

#slide[
    = Herstellen der Normalform
    (#tmagenta[Prämissen sind rot.] #tblue[Konklusion ist blau.])

    1. #tmagenta[Kein Mensch ist sterblich oder Fisch ist leicht verderblich]. #tmagenta[Es ist aber nicht so, dass kein Mensch sterblich ist]. *Also* #tblue[ist Fisch leicht verderblich].

    #inference[Kein Mensch ist sterblich oder Fisch ist leicht verderblich.
    ][Es ist nicht so, dass kein Mensch sterblich ist.
    ][Fisch ist leicht verderblich.]
]

/*
#slide[
    = Herstellen der Normalform
    2. #tblue[Einstein hat Recht], *denn* #tmagenta[Einstein oder Newton haben Recht]. Und #tmagenta[Newton hat nicht Recht].

    #inference-raw(```
    Einstein oder Newton haben Recht.
    Newton hat nicht Recht.
    ----
    Einstein hat Recht.
    ```)
]

#slide[
    = Herstellen der Normalform
    3. #tmagenta[Philosophie ist eine Geisteswissenschaft oder gar keine Wissenschaft]. #tblue[Philosophie ist] *damit* #tblue[keine Wissenschaft], *weil* #tmagenta[sie sicher keine Geisteswissenschaft ist].

    #inference-raw(```
    Philosophie ist eine Geisteswissenschaft oder sie ist gar keine Wissenschaft.
    Philosophie ist keine Geisteswissenschaft.
    ----
    Philosophie ist keine Wissenschaft.
    ```)
]
*/

#slide[
    = Normalform-Algorithmus
    // Es gibt kein Backrezept für die Normalform, trotzdem helfen Hinweiswörter! Mit der Zeit entwickelt man ein Gefühl dafür.

    + Hinweiswörter suchen.
    + Konklusion identifizieren.
    + Prämissen sammeln und in beliebiger Reihenfolge aufschreiben.#footnote[Meist wird mit der Reihenfolge der Prämissen schon etwas beabsichtigt, daher macht es Sinn, die Prämissen in der Reihenfolge aufzuschreiben, in der sie aufgezählt worden sind.]
    + Zuerst alle Prämissen, dann ein "Also:" und dahinter die Konklusion. Anstatt des "Also:" kann auch ein langer Strich dienen.
]

#slide[
    = Übung
    #task(time: [EA, 5 min.])[
        Stellen Sie die Normalform der folgenden beiden Argumente her!
    ]

    + Einstein hat Recht, denn Einstein oder Newton haben Recht. Und Newton hat nicht Recht.

    + Philosophie ist eine Geisteswissenschaft oder gar keine Wissenschaft. Philosophie ist daher keine Wissenschaft, weil sie sicher keine richtige Geisteswissenschaft ist.
]

#slide[
    = Übung

    #set text(size: 0.9125em)
    #task(time: [PA, 10 min.])[
        Sammeln Sie aus dem folgenden Schluss die logischen Begriffe heraus, indem Sie entweder die Inhalte der Vorlesung oder den Tafelschwammtest benutzen.
    ]

    #inference[
        Wenn der Bluttest fehlerfrei durchgeführt wurde und das EKG zuverlässig ist, dann kann der Patient sicher diagnostiziert werden.][
        Der Patient konnte nicht sicher diagnostiziert werden und das EKG ist absolut zuverlässig.][
        Der Bluttest wurde nicht fehlerfrei durchgeführt.]
]

#slide[
    = Normalform: Übung 1/2

    #task(time: [EA, 10 min.])[
        Formulieren Sie die Normalformen in Ihrem Arbeitsblatt M5 in eine natürlicher wirkende Textform! Sie dürfen kreativ werden.
    ]

    #figure(diagram(
        spacing: 4em,
        node((0, 0), align(left, inference[Blabla][Haha][Tata])),

        edge((0, 0), (1, 0), "-|>"),
        node((1, 0), [Blabla. *Also* Tata, *denn* Haha.]),
    ))
]

#slide[
    = Normalform: Übung 2/2

    #task(time: [PA, 10 min.])[
        + Tauschen Sie Ihre Formulierung mit einem Partner!
        + Bringen Sie die natürliche Form der Argumente Ihres Partners wieder in die Normalform!
    ]

    #figure(diagram(
        spacing: 4em,
        node((0, 0), [Blabla. *Also* Tata, *denn* Haha.]),

        edge((0, 0), (1, 0), "-|>"),
        node((1, 0), align(left, inference[Blabla][Haha][Tata])),
    ))
]

