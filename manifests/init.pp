# == Class: sc_files
#
# Creates file-resources from hiera hash
#
# === Examples
#
# sc_files::files:
#  '/tmp/test.txt':
#    content: 'Foo'
#  ['/tmp/test/', '/tmp/test/sub/', '/tmp/test/sub/foo/']:
#    ensure: directory
#  '/tmp/foo.bar':
#    source: 'puppet:///modules/sc_files/foo.bar'
#  '/tmp/moo.bar':
#    ensure: present
#
# sc_files::templates:
#  '/tmp/moo.bar': 'sc_files/moo.bar.erb'
#
# sc_files::template_vars:
#  'my_var': 'Hello World.'
#
# === Authors
#
# Thomas Lohner <tl@scale.sc>
#
# === Copyright
#
# Copyright 2016 ScaleCommerce GmbH.
#
class sc_files {

  $files = hiera_hash('sc_files::files', {})
  $template_vars = hiera_hash('sc_files::template_vars', {})
  $templates = hiera_hash('sc_files::templates', {})

  create_resources('file', $files)

  # loop thorugh file resources and append template function
  each($templates) |$k, $v| {
    File <| title == $k |> { content => template($v) }
  }
}
