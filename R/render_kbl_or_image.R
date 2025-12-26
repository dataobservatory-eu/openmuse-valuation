render_kbl_or_image <- function(
    kbl_obj,
    path,
    figure_dir = save_dir
) {

  # --- LaTeX: return object, let knitr handle it ---
  if (knitr::is_latex_output()) {
    return(kbl_obj)
  }

  # --- HTML: print explicitly ---
  if (knitr::is_html_output()) {
    print(kbl_obj)
    return(invisible(NULL))
  }

  # --- Word / EPUB / others: use pre-rendered image ---
  full_path <- file.path(figure_dir, path)

  if (file.exists(full_path)) {
    knitr::include_graphics(
      full_path)
  } else {
    cat("⚠️ Pre-saved table image is missing:", full_path)
  }
}

