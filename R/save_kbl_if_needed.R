save_kbl_if_needed <- function(
    kbl_obj,
    is_saving = TRUE,
    path,
    figure_dir = save_dir,
    zoom = 3,
    ...
) {
  full_path <- file.path(figure_dir, path)

  if (is.null(is_saving)) {
    is_saving <- isTRUE(create_new_figures)
  }

  if (!is_saving) {
    return(invisible(NULL))
  }

  # Never save during LaTeX/PDF rendering
  if (knitr::is_latex_output()) {
    return(invisible(NULL))
  }

  message("Saving table: ", full_path)

  if (is_saving) {
    message("Saving table: ", full_path)

    kableExtra::save_kable(
      kbl_obj,
      file = full_path,
      zoom = zoom,
      ...
    )
  }

  invisible(NULL)
}
