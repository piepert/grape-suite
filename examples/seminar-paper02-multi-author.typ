#import "../src/seminar-paper.typ" as seminar-paper

#set text(lang: "GB")

#show: seminar-paper.project.with(
    title: [A Comparative Survey of Sandbox Security Models],
    subtitle: [Template showcase with fake metadata],

    submit-to: [Submitted to],
    submit-by: [Submitted by],

    university: [Northbridge Technical University],
    faculty: [Faculty of Applied Computing],
    institute: [Institute for Systems Engineering],
    seminar: [Secure Software Seminar],
    semester: [Spring 2026],
    docent: [Dr. Avery Morgan],

    author: "Legacy Single Author",
    authors: (
        (
            name: "Alex Rowan",
            email: "alex.rowan@example.edu",
            student-number: "NTU-10482",
            address: [11 Cedar Lane, Brookfield, MA 01010],
        ),
        (
            name: "Samira Hale",
            email: "samira.hale@example.edu",
            student-number: "NTU-10617",
            address: [92 Pine Street, Lakeview, MA 01011],
        ),
    ),
    student-number: "LEGACY-0000",
    email: "legacy.author@example.edu",
    address: [Legacy Address, Legacy City],

    title-page-part: none,
    title-page-part-submit-date: none,
    title-page-part-submit-to: none,
    title-page-part-submit-by: none,

    sentence-supplement: [Example],

    date: datetime(year: 2026, month: 2, day: 19),
    date-format: (d) => if type(d) == type(datetime.today()) {
        d.display("[month repr:long] [day], [year]")
    } else {
        d
    },

    header: none,
    header-left: none,
    header-middle: none,
    header-right: none,
    show-header-line: true,

    footer: none,
    footer-left: none,
    footer-middle: none,
    footer-right: none,
    show-footer-line: true,

    show-outline: true,
    show-todolist: true,
    show-declaration-of-independent-work: true,

    page-margins: (top: 2.6cm, bottom: 2.6cm, left: 2.6cm, right: 3.8cm),

    fontsize: 11pt,
)

= Scope
This file is a full-feature example for `seminar-paper.project` using fake names and sample metadata.

[Replace with your institution data.]

= Notes
The default header uses compact multi-author formatting (`first author, et al.`) when `authors` has more than one entry.
