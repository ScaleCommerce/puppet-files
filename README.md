# sc_files

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
cd /etc/puppet/modules/sc_files
ln -s /path/to/yourdata/files files
ln -s /path/to/yourdata/templates templates
```

## Hiera Varibales

`sc_files::files` Hash of file resources, see [Puppet File Reference](https://docs.puppet.com/puppet/latest/reference/type.html#file) for documentation of params.

`sc_files::templates` Configure which template should be used for a file, see [Usage](#usage) for examples.

`sc_files::template_vars` You can use these variables in your templates like `<%= @template_vars['my_var'] %>`. These variables are global for all templates, you might want to prefix their names somehow.

## Usage

Write a simple file:

```
sc_files::files:
  '/tmp/test/':
    ensure: present
    content: 'foo'
```

Create a recursive directory structure:

```
sc_files::files:
  ['/tmp/test/', '/tmp/test/sub/', '/tmp/test/sub/foo/']:
    ensure: directory
```

Copy a file from local or any other module's `file` path:

```
sc_files::files:
  '/tmp/foo.bar':
    source: 'puppet:///modules/sc_files/foo.bar'
```

Create a file from local or any other module's `template` with template variables:

```
sc_files::files:
  '/tmp/moo.bar':
    ensure: present

sc_files::templates:
  '/tmp/moo.bar': 'sc_files/moo.bar.erb'

sc_files::template_vars:
  'my_var': 'Hello World.'
```