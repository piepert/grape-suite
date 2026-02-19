#let _str-type = type("")
#let _dict-type = type((:))

#let _dict-get(dict, key, default: none, aliases: ()) = {
    if key in dict {
        dict.at(key)
    } else {
        let value = none
        for alias in aliases {
            if alias in dict {
                value = dict.at(alias)
            }
        }

        if value != none { value } else { default }
    }
}

#let _normalize-author-item(item) = {
    if type(item) == _dict-type {
        if not ("name" in item) {
            panic("Each item in `authors` must include a `name` field.")
        }

        (
            name: item.at("name"),
            email: _dict-get(item, "email"),
            student-number: _dict-get(item, "student-number", aliases: ("student_number",)),
            address: _dict-get(item, "address"),
        )
    } else {
        (
            name: item,
            email: none,
            student-number: none,
            address: none,
        )
    }
}

#let normalize-authors(authors, author: none, email: none, student-number: none, address: none) = {
    if authors != none {
        if type(authors) != type(()) {
            panic("`authors` must be an array.")
        }

        let normalized = ()
        for item in authors {
            let normalized-item = _normalize-author-item(item)
            if normalized-item.at("name") == none {
                panic("Author name must not be `none`.")
            }
            normalized.push(normalized-item)
        }

        normalized
    } else if author != none {
        (
            (
                name: author,
                email: email,
                student-number: student-number,
                address: address,
            ),
        )
    } else {
        ()
    }
}

#let author-name(author-item, link-names: true) = {
    let name = author-item.at("name")
    let email = author-item.at("email")

    if link-names and email != none and type(email) == _str-type {
        link("mailto:" + email, name)
    } else {
        name
    }
}

#let authors-full(authors, separator: [\ ]) = {
    if authors.len() == 0 {
        none
    } else {
        authors.map(author => author-name(author)).join(separator)
    }
}

#let authors-compact(authors, link-names: true) = {
    if authors.len() == 0 {
        none
    } else if authors.len() == 1 {
        author-name(authors.first(), link-names: link-names)
    } else {
        [#author-name(authors.first(), link-names: link-names), et al.]
    }
}

#let author-submit-block(authors, link-names: true) = {
    if authors.len() == 0 {
        none
    } else {
        authors.map(author => [
            #let name = author-name(author, link-names: link-names)
            #let student-number = author.at("student-number")
            #if student-number != none {
                name + [ (#student-number)]
            } else {
                name
            }
            #if author.at("address") != none [\ #author.at("address")]
        ]).join([\ \ ])
    }
}
