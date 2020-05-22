#' リッチなrmarkdown::html_document
#'
#' `toc`, `toc_float`, `numbber_sections`, `code_folding`, `code_download`を
#' 有効にした。
#'
#' @inheritParams rmarkdown::html_document
#' @param ... `rmarkdown::html_document`に渡す引数。
#'
#' @export
rich_html_document <- function(
  # 後から無効にする可能性もあるなら、html_documentに渡す引数は
  # bodyに直接書かず、引数として書いておくと良い
  toc = TRUE,
  toc_float = TRUE,
  number_sections = TRUE,
  code_folding = "show",
  code_download = TRUE,
  ...
) {
  rmarkdown::html_document(
    toc = toc,
    toc_float = toc_float,
    number_sections = number_sections,
    code_folding = code_folding,
    code_download = code_download,
    ...
  )
}
