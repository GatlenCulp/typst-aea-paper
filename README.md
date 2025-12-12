# The American Economics Association Paper Template
<div align="center">Version 0.1.0</div>

American Economics Association paper template. Minimally implemented, not ready for submission or official, but felt worth sharing as a starting point regardless. Derived from IEEE-Charged template. Developed in reference to this template: https://www.overleaf.com/latex/templates/journal-template-for-aea-papers-and-proceedings-p-and-p/scjnwckghgyh

## Getting Started

<!-- <picture>
  <source media="(prefers-color-scheme: dark)" srcset="./thumbnail-dark.svg">
  <img src="./thumbnail-light.svg">
</picture> -->

### Installation

A step by step guide that will tell you how to get the development environment up and running. This should explain how to clone the repo and where to (maybe a link to the typst documentation on it), along with any pre-requisite software and installation steps.

```bash
# CLone this repository and cd into it
$ git clone git@github.com:GatlenCulp/typst-aea-paper.git
$ cd typst-aea-paper
# Requires "just" be installed. Installs the package to your Typst local files to be imported with @local/aea-paper
$ just install
```

## Usage

A more in-depth description of usage. Any template arguments? A complicated example that showcases most if not all of the functions the package provides? This is also an excellent place to signpost the manual.

```typ
#import "@local/aea-paper:0.1.0": *

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
```

## Initialize Template


Alternatively, you can use the CLI to kick this project off using the command
```
typst init @local/aea-paper
```

Typst will create a new directory with all the files needed to get you started.


## Configuration
This template exports the `ieee` function with the following named arguments:

- `title`: The paper's title as content.
- `authors`: An array of author dictionaries. Each of the author dictionaries
  must have a `name` key and can have the keys `department`, `organization`,
  `location`, and `email`. All keys accept content.
- `abstract`: The content of a brief summary of the paper or `none`. Appears at
  the top of the first column in boldface.
- `index-terms`: Array of index terms to display after the abstract. Shall be
  `content`.
- `paper-size`: Defaults to `us-letter`. Specify a [paper size
  string](https://typst.app/docs/reference/layout/page/#parameters-paper) to
  change the page format.
- `bibliography`: The result of a call to the `bibliography` function or `none`.
  Specifying this will configure numeric, IEEE-style citations.
- `figure-supplement`: How figures are referred to from within the text. Use
  `"Figure"` instead of `"Fig."` for computer-related publications.

The function also accepts a single, positional argument for the body of the
paper.

## TODO
TODO: [typst-template] Get the AEA template to use appendix properly. Learn the best way to do this.