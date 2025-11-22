// #import "../src/lib.typ": aea
#import "@local/aea-paper:0.1.0": aea

#show: aea.with(
  title: [Title],
  short-title: [Short title for running head],
  authors: (
    (
      name: "Author1",
      affiliation: "affiliation1",
      email: "email1",
    ),
    (
      name: "Author2",
      affiliation: "affiliation2",
      email: "email2",
    ),
  ),
  acknowledgments: [Acknowledgements],
  pub-month: "Month",
  pub-year: "Year",
  pub-volume: "Vol",
  pub-issue: "Issue",
  draft: false, // Set to true for 1.5 spacing
  bibliography: bibliography("refs.bib"),
)

Papers and Proceedings Pointers:

- This journal does not use an abstract.

- Do not use an "Introduction" heading. Begin your introductory material before the first section heading.

- Avoid style markup (except sparingly for emphasis).

- Avoid using explicit vertical or horizontal space.

- Captions are short and go below figures but above tables.

- Include any notes or sources in the caption text.

- If you are using an appendix, it goes last, after the bibliography. Use regular section headings to make the appendix headings.

- If you are not using an appendix, you may delete the appendix heading.

= First Section in Body

Sample figure:

#figure(
  [Figure content here.],
  caption: [Caption for figure below. _Note:_ Figure notes can be included here. _Source:_ Source information can also be included.],
)

Sample table:

#figure(
  table(
    columns: 3,
    [], [Heading 1], [Heading 2],
    [Row 1], [1], [2],
    [Row 2], [3], [4],
  ),
  caption: [Caption for table above. _Note:_ Table notes can be included here. _Source:_ Source information can also be included.],
  kind: table,
)

References will appear here automatically if you include citations in your text using `@citation-key`.

#align(center)[
  #text(size: 12pt, weight: 700)[APPENDIX]
]

= Mathematical Appendix

