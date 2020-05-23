#' rmarkdown::word_documentにオリジナルテンプレートを適用した版
#'
#' @param reference_docx
#'   既定値ならtokyor85downパッケージが用意した
#'   オリジナルのテンプレートファイルを利用する。
#'   それ以外なら指定した値ををそのまま利用する。
#' @param ...
#'   `rmarkdown::word_document`に渡す引数。
#'
#' @export
styled_word_document <- function(
                                 reference_docx = spec_reference_docx(),
                                 ...) {
  rmarkdown::word_document(
    reference_docx = reference_docx,
    ...
  )
}

#' オリジナルなWordのテンプレファイルを返す関数
#'
#' パッケージのルートディレクトリから見た
#' `inst/docx/reference.docx`
#' の絶対パスを返す
#'
#' 注意: `system.file`は必ず関数の中で使うこと。
#' CRANなどがバイナリにコンパイルすると、
#' テンプレートファイルへのパスがコンパイル環境下のものに
#' 固定されてしまう。
#'
#' @export
spec_reference_docx <- function() {
  system.file(
    "docx", "reference.docx",
    package = "tokyor85down"
  )
}
