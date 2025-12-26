render_kbl_or_image <- function(
    kbl_obj,
    path,
    figure_dir = save_dir
) {
  # HTML or LaTeX: render live table and exit immediately
  if (knitr::is_latex_output() || knitr::is_html_output()) {
    print(kbl_obj)
    return(invisible(NULL))
  }

  # Only Word / other formats reach this point
  full_path <- file.path(figure_dir, path)

  if (file.exists(full_path)) {
    knitr::include_graphics(full_path)
  } else {
    cat("⚠️ Pre-saved table image is missing:", full_path)
  }
}
