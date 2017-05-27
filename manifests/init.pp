# == Class: files
#
# Creates file resources from hiera hash
#
class sc_files (
  $template_vars = {},
  $templates = {}
){
  # lookup and create files resources in hiera
  create_resources('file', hiera_hash('files', {}))

  # loop through template hash append template function to files
  each($templates) |$k, $v| {
    File <| title == $k |> { content => template("files/$v") }
  }
}
