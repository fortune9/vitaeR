#' Awesomeresume template (compact, monochrome)
#'
#' A compact resume template based on Awesome-CV with tighter margins and no color.
#'
#' @param ... Arguments passed to \code{\link[vitae]{cv_document}}.
#' @inheritParams rmarkdown::pdf_document
#' @param page_total If TRUE, show total pages in footer.
#' @param show_footer If TRUE, include footer with name and page numbers.
#' @export
awesomeresume <- function(..., latex_engine = "xelatex", page_total = FALSE,
                          show_footer = TRUE) {
  template <- system.file("rmarkdown", "templates", "awesomeresume",
                          "resources", "awesome-resume.tex",
                          package = "vitae"
  )

  set_entry_formats(awesome_resume_entries)
  # Reuse supporting files (class, fonts) from the awesomeresume skeleton
  # (the class file was renamed to awesome-resume.cls)
  copy_supporting_files("awesomeresume")
  pandoc_vars <- list()
  if(page_total) pandoc_vars$page_total <- TRUE
  if(show_footer) pandoc_vars$show_footer <- TRUE
  cv_document(..., pandoc_vars = pandoc_vars,
              template = template, latex_engine = latex_engine)
}

awesome_resume_entries <- new_entry_formats(
  brief = function(what, when, with){
    paste(
      c(
        "\\begin{cvhonors}",
        glue_alt("\t\\cvhonor{}{<<what>>}{<<with>>}{<<when>>}"),
        "\\end{cvhonors}"
      ),
      collapse = "\n"
    )
  },
  detailed = function(what, when, with, where, why){
    why <- lapply(why, function(x) {
      if(length(x) == 0) {
        "{}\\vspace{-4.0mm}"
      } else {
        paste(c("{\\begin{cvitems}", paste("\\item", x), "\\end{cvitems}}"),
              collapse = "\n")
      }
    })

    paste(c(
      "\\begin{cventries}",
      glue_alt("\t\\cventry{<<what>>}{<<with>>}{<<where>>}{<<when>>}<<why>>"),
      "\\end{cventries}"
    ), collapse = "\n")
  }
)
