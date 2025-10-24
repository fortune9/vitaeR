# Project Overview

This repository is an R package containing multiple Rmarkdown templates designed to
create CV and resume documents.

The repository inherits from the R package [vitae](https://github.com/mitchelloharawild/vitae),
but adds additional templates and functionality, such as `awsomeresume`.

## Folder Structure

- `R/`: Contains R functions that define the templates and their behavior.
- `inst/rmarkdown/templates/`: Contains the Rmarkdown templates for CVs and resumes.
- `man/`: Contains documentation files for the R functions.
- `vignettes/`: Contains vignettes that provide detailed examples and usage instructions for the package.
- `tests/`: Contains test files to ensure the package functions correctly.
- `DESCRIPTION`: Contains metadata about the package, including dependencies and version information.
- `NAMESPACE`: Manages the export of functions and imports from other packages.
- `.github/`: Contains GitHub-specific files, including issue templates and workflows.

## Coding Standards

- Follow the [tidyverse style guide](https://style.tidyverse.org/) for R code.
- Use best practices when creating LaTeX templates or classes.
- Use roxygen2 for documentation.
- Write unit tests using the testthat package.
- Ensure compatibility with the latest version of R and common operating systems.
- Use meaningful commit messages and follow semantic versioning for releases.
- Include examples and vignettes to demonstrate package functionality.
- Adhere to best practices for R package development as outlined in "R Packages" by Hadley Wickham.
- Ensure all dependencies are properly listed in the DESCRIPTION file.
- Maintain a clear and organized folder structure for ease of navigation and maintenance.
- Regularly update documentation to reflect changes in functionality.
- Use continuous integration tools to automate testing and building of the package.
- Engage with the community through GitHub issues and pull requests for collaborative development.


