#' rmarkdown::html_documentにオリジナルスタイルシートを適用した版
#'
#' @inheritParams rmarkdown::html_document
#' @param line_breaks
#'   Rmd内の改行の扱い。
#'   既定値は改行の前後が全角文字なら詰め、それ以外なら半角スペースを入れる
#'   （`"east_asian_line_breaks"`）。
#' @param ...
#'   `rmarkdown::html_document`に渡す引数。
#'
#' @export
styled_html_document <- function(extra_dependencies = NULL,
                                 md_extensions = NULL,
                                 line_breaks = c(
                                   "east_asian_line_breaks",
                                   "hard_line_breaks",
                                   "ignore_line_breaks",
                                   "default"
                                 ),
                                 ...) {
  # ユーザーが指定した依存ファイルの方が優先されるように、
  # dependencies, extra_dependenciesの順で指定する
  extra_dependencies <-
    append(list(dep_css()), extra_dependencies)

  # 同様にユーザーが指定したmd_extensionsを優先する
  line_breaks <-
    match.arg(line_breaks)

  md_extensions <-
    if (line_breaks == "default") {
      md_extensions
    } else {
      c("+", line_breaks, md_extensions)
    }

  # カスタマイズしたhtml_documentの生成
  rmarkdown::html_document(
    extra_dependencies = extra_dependencies,
    md_extensions = md_extensions,
    ...
  )
}





#' styled_html_documentの依存ファイル
#'
#' @noRd
dep_css <- function() {
  # パッケージ名
  pkg <- "tokyor85down"

  htmltools::htmlDependency(
    name = pkg, # 適当な名前。今回はパッケージ名にした。
    version = packageVersion(pkg), # バージョン。今回はパッケージに準じた。
    src = "css", # 依存ファイルの保存先。package引数を指定しておくと、inst以下のディレクトリを相対パスで指定できる。
    stylesheet = "style.css", # 依存したいスタイルシートのファイル名
    package = pkg # 依存ファイルを提供するパッケージの名前。
  )
}
