// This function formats your document as an article in the style of the AEA
// (American Economic Association) Papers and Proceedings.

// TODO: [typst-template] Get the AEA template to use appendix properly. Learn the best way to do this.

#let aea(
  // The paper's title.
  title: [Paper Title],
  // Short title for running head.
  short-title: none,
  // An array of authors. For each author you can specify a name,
  // affiliation, and email. Everything but the name is optional.
  authors: (),
  // Acknowledgments text.
  acknowledgments: none,
  // Publication metadata
  pub-month: none,
  pub-year: none,
  pub-volume: none,
  pub-issue: none,
  // The article's paper size.
  paper-size: "us-letter",
  // The result of a call to the `bibliography` function or `none`.
  bibliography: none,
  // Draft mode with increased spacing
  draft: false,
  // The paper's content.
  body,
) = {
  // Set document metadata.
  set document(title: title, author: authors.map(author => author.name))

  // Set the body font (Times-like for accurate page count).
  set text(font: "TeX Gyre Termes", size: 12pt)

  // Configure footnotes to use numbers instead of symbols
  set footnote(numbering: "1")

  // Configure the page.
  set page(
    paper: paper-size,
    margin: (x: 1in, top: 1in, bottom: 1in),
    header: if short-title != none {
      context {
        let page-num = counter(page).get().first()
        if page-num > 1 [
          #set text(size: 10pt)
          #set align(center)
          #upper(short-title)
        ]
      }
    },
    numbering: "1",
    number-align: center + bottom,
  )

  // Configure paragraph spacing (draft mode uses double spacing).
  set par(
    justify: true,
    first-line-indent: 1.5em,
    leading: if draft { 1.3em } else { 0.55em },
  )


  // Configure headings.
  set heading(numbering: "I.A.1.a)")
  show heading: it => {
    let levels = counter(heading).get()
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    set text(size: 12pt, weight: 700)
    if it.level == 1 {
      set align(center)
      show: block.with(above: 2em, below: 1em, sticky: true)
      set text(size: 12pt)
      if it.numbering != none {
        numbering("I.", deepest)
        h(7pt, weak: true)
      }
      it.body
    } else if it.level == 2 {
      set text(style: "italic", weight: 400)
      show: block.with(above: 1.5em, below: 1.25em, sticky: true)
      if it.numbering != none {
        numbering("A.", deepest)
        h(7pt, weak: true)
        upper(it.body)
      } else {
        upper(it.body)
      }
    } else {
      show: block.with(above: 1em, below: 0.75em, sticky: true)
      if it.numbering != none {
        numbering("1.", deepest)
        h(7pt, weak: true)
      }
      it.body
    }
  }

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt, marker: ([•], [◦], [‣]))

  // Tables & figures
  show figure: set block(spacing: 1em)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: image): set figure.caption(position: bottom)
  show figure.caption: set text(size: 11pt)
  show figure.caption: set align(left)

  // Table styling: no stroke, small caps captions
  set table(stroke: none)
  show figure.caption.where(kind: table): smallcaps
  show figure.caption.where(kind: image): smallcaps

  // Figure and table numbering
  show figure.where(kind: table): set figure(supplement: [Table], numbering: "1")
  show figure.where(kind: image): set figure(supplement: [Figure], numbering: "1")

  // Configure equation numbering.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  // Style bibliography.
  set std.bibliography(title: text(12pt, weight: 700)[REFERENCES], style: "ieee")
  show std.bibliography: set text(12pt)

  // Display the paper's title and metadata at the top.
  {
    set align(center)
    set text(size: 14pt, weight: 700, font: "TeX Gyre Heros")
    title
    v(0.5em)

    // Display authors
    set text(size: 12pt, weight: 400)
    let author-names = authors.map(a => smallcaps(a.name)).join(smallcaps[ and ])
    [_By_ #author-names]

    // Display acknowledgments as footnote
    if acknowledgments != none or authors.any(a => "affiliation" in a or "email" in a) {
      footnote({
        for (i, author) in authors.enumerate() [
          #author.name: #if "affiliation" in author [#author.affiliation]#if "email" in author [ (#link("mailto:" + author.email)[#author.email])]#if i < authors.len() - 1 [; ]
        ]
        if acknowledgments != none [ #acknowledgments]
      })
    }

    v(1em)
  }

  // TODO(Gatlen): Fix appendix function to have proper numbering
  let appendix(unused: none, body) = {
    let appendixNumbering = (..args) => {
      let (h1, ..h2-onward) = args.pos()
      let num = if h2-onward.len() == 0 {} else { numbering("1", ..h2-onward) }
      num
    }

    set heading(numbering: appendixNumbering, supplement: [Appendix])

    counter(heading).update(0)
    body
  }

  // Display the paper's contents.
  body

  // Display bibliography.
  bibliography
}
