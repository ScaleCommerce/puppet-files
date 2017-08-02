# files

#### Table of Contents

1. [Overview](#overview)
1. [Module Description - What the module does and why it is useful](#module-description)
1. [Setup - What you need to do before using this module](#setup)
1. [Hiera Variables - What you need to configure in hiera](#hiera-variables)
1. [Usage - Configuration options and additional functionality](#usage)

## Overview

Manage Puppet file-resources in hiera.

## Module Description

This is a wrapper module to manage puppet file-resources in hiera.

## Setup

This module also abstracts templates and static files features. In order to use this you need to symlink `files` and `templates` in the module directory to a path or repository containing your files and templates.

```
cd /etc/puppet/modules/files
ln -s /path/to/yourdata/files
ln -s /path/to/yourdata/templates
```

## Hiera Variables

`files` Hash of file resources, see [Puppet File Reference](https://docs.puppet.com/puppet/latest/reference/type.html#file) for documentation of params.

`files::templates` Configure which template should be used for a file, see [Usage](#usage) for examples.

`files::template_vars` You can use these variables in your templates like `<%= @template_vars['my_var'] %>`. These variables are global for all templates, you might want to prefix their names somehow.

## Usage

Write a simple file:

```
files:
  /tmp/test.txt:
    content: foo
```

Multiline example:

```
files:
  /tmp/multi.txt:
    content: |+
             This is a
             file with a
             lot of lines.
```

Hiera variables in content, see [documentation for hiera lookup functions](https://docs.puppet.com/hiera/3.3/puppet.html#hiera-lookup-functions):

```
host_ip: 192.168.1.1

files:
  /tmp/test.txt:
    content: My ip is %{hiera('host_ip')}
```

Create a recursive directory structure:

```
files:
  ['/tmp/test/', '/tmp/test/sub/', '/tmp/test/sub/bar/']:
    ensure: directory
```

Copy a file from this or any other module's `file` path:

```
files:
  /tmp/foo.bar:
    source: puppet:///modules/files/foo.bar
  /tmp/my.file
    source: puppet:///modules/<other module name>/my.file
  /tmp/local.txt
    source: /my/path/local.txt

```

To create a file from this or any other module's `template` path, you need to declare at least an empty file resource and then assign a template to the title of the file resource. Optionally use template variables:

```
files:
  /tmp/moo.bar:
    owner: www-data
  /tmp/vhost.conf: {}

files::templates:
  /tmp/moo.bar: files/moo.bar.erb
  /tmp/vhost.conf: <other module name>/vhost.erb

files::template_vars:
  my_var: Hello World.
```
