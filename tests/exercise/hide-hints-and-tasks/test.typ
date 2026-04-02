#import "/src/library.typ": colors, exercise
#import exercise: hint, project, solution, subtask, task
#import colors: *

#show: project.with(
    title: [History Exam],
    type: "Exam",

    show-point-distribution: true,
    show-namefield: true,
    show-timefield: true,

    max-time: 25,
    show-lines: true,

    university: [],
    institute: [],

    abstract: [Task 1 is a facultative task. For each task 2 and 3, choose either version A or B. If both are solved, neither are scored.],
)

#hint(lorem(10))

#solution(lorem(10))
