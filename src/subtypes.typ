#import "colors.typ": purple
#import "exercise.typ" as exercise
#import "todo.typ": todo
#import "authors.typ": normalize-authors, authors-full, authors-compact

#let essay(
        title: [#todo[Title]],
        university: [#todo[University]],
        institute: [#todo[Institute]],
        seminar: [#todo[Seminar]],
        semester: [#todo[Semester]],
        docent: [#todo[Docent]],
        author: [#todo[Author]],
        authors: none,
        date: [#todo[Date]],
        body) = {

    let ifnn(b) = if b != none [#b\ ]
    let normalized-authors = normalize-authors(authors, author: author)
    let full-authors = authors-full(normalized-authors)
    let compact-authors = authors-compact(normalized-authors)
    show: exercise.project.with(
        page-margins: (right: 4cm),

        title: none,
        type: none,
        no: none,
        suffix-title: none,

        header: context if counter(page).get().first() > 1 [
            #set text(size: 0.75em)
            #title #h(1fr) #compact-authors
            #v(-0.5em)
            #line(length: 100%, stroke: purple)
        ],

        show-header-line: false,
        footer: none,
    )

    {
        v(-3em)
        set text(size: 0.75em)

        grid(columns: (1fr, auto), column-gutter: 10%)[
            #ifnn(university)
            #ifnn(institute)
            #ifnn(seminar)
            #docent
        ][
            #set align(right)
            #ifnn(semester)
            #ifnn(full-authors)
            #date
        ]

        v(-0.5em)
        line(length: 100%, stroke: purple)
    }

    v(1em)

    exercise.big-heading(title)
    set par(leading: 1em, first-line-indent: 1.5em, spacing: 1em)
    show heading: set par(leading: 0.65em)
    body
}



#let protocol(
        title: [#todo[Title]],
        university: [#todo[University]],
        institute: [#todo[Institute]],
        seminar: [#todo[Seminar]],
        semester: [#todo[Semester]],
        docent: [#todo[Docent]],
        author: [#todo[Author]],
        authors: none,
        date: [#todo[Date]],
        body) = {

    let ifnn(b) = if b != none [#b\ ]
    let normalized-authors = normalize-authors(authors, author: author)
    let full-authors = authors-full(normalized-authors)
    show: exercise.project.with(
        title: none,
        type: none,
        no: none,
        suffix-title: none,

        header: context if counter(page).get().first() > 1 [
            #set text(size: 0.75em)
            #date: #title
            #v(-0.5em) #line(length: 100%, stroke: purple)
        ],

        show-header-line: false,
        footer: none,
    )

    {
        v(-5em)
        set text(size: 0.75em)

        grid(columns: (1fr, auto), column-gutter: 10%)[
            #ifnn(university)
            #ifnn(institute)
            #ifnn(seminar)
            #docent
        ][
            #set align(right)
            #ifnn(semester)
            #ifnn(full-authors)
            #date
        ]

        v(-0.5em)
        line(length: 100%, stroke: purple)
    }

    v(1em)

    exercise.big-heading(title)
    set par(first-line-indent: 1.5em, spacing: 0.65em)
    show heading: set par(leading: 0.65em)
    body
}
