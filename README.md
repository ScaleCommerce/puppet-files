# sc_files

#### Table of Contents

1. [Overview](#overview)
1. [Module Description - What the module does and why it is useful](#module-description)
1. [Setup - What you need to do before using this module](#setup)
1. [Usage - Configuration options and additional functionality](#usage)

## Overview

Manage Puppet file-resources in hiera.

## Module Description

This is a wrapper module to manage puppet file-resources in hiera.

## Setup

This module also abstracts templates and static files features. In order to use this you need to symlink `files` and `templates` in the module directory to a repository containing your files and templates.

```
cd /etc/puppet/modules/
ln -s /path/to/yourdata/files files
ln -s /path/to/yourdata/templates templates
```

## Usage

Write a simple file:

```
sc_files::files:
  '/tmp/test/':
    enusre: present
    content: 'foo'
```

Create a recursive directory structure:

```
sc_files::files:
  ['/tmp/test/', '/tmp/test/sub/', '/tmp/test/sub/foo/']:
    enusre: directory
```
