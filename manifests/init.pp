# == Class: sc_files
#
# Creates file-resources from hiera hash
#
# === Examples
#
#  sc_files::files:
#    '/tmp/test.txt':
#      ensure: present
#      content: 'Foo'
#    '/tmp/test/':
#      ensure: directory
#      owner: root
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

  $template_vars = hiera_hash('sc_files::template_vars', {})
  $files = hiera_hash('sc_files::files', {})
  create_resources('file', $files)

}
