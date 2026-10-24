# Contributing

## Getting Started

grape-suite is a [Typst](https://typst.app) template collection for teaching and writing. Its goal is to be a modern template that makes it easy for teachers to create exercises, exams and lecture notes, and for students to write papers, hand in exercises, create presentation slides, etc.

Right now there is no API documentation besides the `README.md`. This is a goal for the future.

Use [prek](https://github.com/j178/prek) or [pre-commit](https://pre-commit.com/) and activate the hooks before contributing.

## Pull Requests

Please ensure that each pull requests follows the following points:

1. Your pull requests should solve exactly one problem. Restructuring the project beyond this one problem is not recommended. If you want to solve multiple problems, create multiple pull requests.
2. Use [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).
3. If you introduce new features or change or remove old features:
   - Update `README.md` for documentation.
   - Write tests using [Tytanic](https://github.com/typst-community/tytanic/).
4. The example files are not documentation. Ask the maintainer before you add new example files.
5. Use [prek](https://github.com/j178/prek) or [pre-commit](https://pre-commit.com/) to ensure consistent code formatting.

## Tests

This project includes tests using [Tytanic](https://github.com/typst-community/tytanic/).
The tests can be found in the [`tests`](tests) directory and executed by running the command `tt run --font-path tests/.fonts/` from the repository's root directory, using the fonts included in the `tests` directory.
When running the tests, ensure you are using the expected version of Tytanic.
The Tytanic version dictates the Typst version used under the hood.
The tests in this repository were compiled with Tytanic version 0.4.1, using Typst version 0.15.1.
