

# vitae <img src="man/figures/logo.png" align="right" />

*/ˈviːteɪ/*

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/vitae.png)](https://cran.r-project.org/package=vitae)
[![R check
status](https://github.com/mitchelloharawild/vitae/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitchelloharawild/vitae/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html#maturing)
[![Downloads](https://cranlogs.r-pkg.org/badges/vitae.png)](https://cran.r-project.org/package=vitae)
<!-- badges: end -->

## Templates and tools for making a Résumé/CV

The *vitae* package makes creating and maintaining a Résumé or CV with R
Markdown simple. It provides a collection of LaTeX and HTML templates,
with helpful functions to add content to the documents.

## Installation

# vitae (forked and extended)

This repository is a local fork of the vitae package available at
https://github.com/mitchelloharawild/vitae. It includes the original
vitae templates and tools for producing Résumés/CVs from R Markdown, and
adds a custom, compact resume format `awesomeresume`.

Important notes
- This repository is based on the upstream 'vitae' project by
  Mitchell O'Hara-Wild: https://github.com/mitchelloharawild/vitae
- The content in this fork includes additional local changes. The main
  change in this fork is the addition of the `awesomeresume` output
  format (see details below).

What I added in this fork
- New R Markdown output format: `vitae::awesomeresume`
  - Purpose: a compact, black-and-white resume template based on the
    Awesome-CV layout but adjusted for tighter margins, denser
    typography, and an inline contact/header layout.
  - Files added/modified for the new format are under:
    - `inst/rmarkdown/templates/awesomeresume/` (template, resources,
      skeleton)
    - `R/awesomeresume.R` (the R wrapper that registers the output
      format)
  - Key features:
    - Tighter document margins: left/right = 0.5in, top/bottom = 0.66in
    - Monochrome defaults (fonts and section highlight colors set to
      black in the template)
    - A YAML variable `section_spacing` to let you reduce vertical
      spacing below section headers, e.g. `section_spacing: "-1mm"`
    - Compact default header that keeps name large and prints position
      + contact items inline (they naturally wrap when too long)

How to install (development)

You can use the development version from this repository with `remotes`:

```r
# install.packages("remotes")
remotes::install_github("mitchelloharawild/vitae")
# if you are working from a local clone and want to load the package:
# devtools::load_all('.')
```

Note: building/using the templates requires a working LaTeX setup
(XeLaTeX recommended). See the `tinytex` package for a simple setup
option if you don't already have LaTeX installed.

Quick example: using the new awesomeresume format

Create an R Markdown document with the following YAML header:

```yaml
---
title: "Resume"
output:
  vitae::awesomeresume: default
name: "Jane"
surname: "Doe"
position: "Data Scientist"
address: "City, Country"
email: "jane@example.com"
github: "janedoe"
section_spacing: "-1mm"  # optional: reduces spacing beneath section headings
---
```

Then render with:

```r
rmarkdown::render('your_resume.Rmd')
```

Development notes & testing
- The awesomeresume format copies supporting files from
  `inst/rmarkdown/templates/awesomeresume/skeleton/` at render time. The
  class file shipped with the skeleton is named `awesome-resume.cls` and
  is requested by the template's `\\documentclass{awesome-resume}` line.
- If you see LaTeX errors about missing class files, ensure the working
  directory contains `awesome-resume.cls` or render via the provided
  output format so the supporting files are copied automatically.

Want different defaults?
- The template intentionally sets monochrome defaults. If you prefer
  colored accents or a different margin setup, edit
  `inst/rmarkdown/templates/awesomeresume/resources/awesomeresume-cv.tex`.

License & upstream
- This fork follows the same license and contribution policies as the
  upstream `vitae` project. Please refer to the upstream repository for
  contributing guidelines and the contributor code of conduct.

Acknowledgements
- Original project: Mitchell O'Hara-Wild — https://github.com/mitchelloharawild/vitae
- Awesome-CV (LaTeX template) — https://github.com/posquit0/Awesome-CV
  trailing dot in brief entries.
