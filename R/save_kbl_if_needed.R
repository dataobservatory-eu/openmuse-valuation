save_kbl_if_needed <- function(
    kbl_obj,
    is_saving = TRUE,
    path,
    figure_dir = save_dir,
    zoom = 2,
    ...
) {
  full_path <- file.path(figure_dir, path)

  if (is.null(is_saving)) {
    is_saving <- isTRUE(create_new_figures)
  }

  if (is_saving) {
    message("Saving table: ", full_path)

    kableExtra::save_kable(
      kbl_obj,
      file = full_path,
      zoom = zoom,
      ...
    )
  }

  invisible(kbl_obj)
}
