#import "/src/library.typ": german-dates, seminar-paper
#import seminar-paper: definition, hint, notice, solution, task

#let hint = hint.with(figured: true)
#let definition = definition.with(figured: true)
#let notice = notice.with(figured: true)
#let task = task.with(figured: true)
#let solution = solution.with(figured: true)

#show: seminar-paper.project.with(
    title: [Intensionality of That-#sym.wj;Clauses],
    subtitle: [Intensional Contexts in Philosophical Arguments],

    university: [Example University],
    faculty: [Example Faculty],
    institute: [Institute for Philosophy],
    docent: [Dr. phil. Berta Beispielprüferin],
    seminar: [Example Seminar],

    date: [14#super[th] June 2023],

    show-declaration-of-independent-work: true,

    semester: none,

    author: "John Doe",
    student-number: "0123456789",
    email: "john.doe@university.uni",
    address: [
        12345 Musterstadt \
        Musterstraße 67
    ],
)

= Einleitung

#hint(lorem(50))<h-A>

#definition(lorem(50))<d-A>

#notice(lorem(50))<n-A>

#task(lorem(50))<t-A>

#solution(lorem(50))<s-A>

- @h-A
- @d-A
- @n-A
- @t-A
- @s-A


