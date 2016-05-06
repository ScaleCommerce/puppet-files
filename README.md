# sc_files

#### Table of Contents

1. [Overview](#overview)
1. [Module Description - What the module does and why it is useful](#module-description)
1. [Usage - Configuration options and additional functionality](#usage)

## Overview

Manage Puppet file-resources in hiera.

## Module Description

This is a wrapper module to manage puppet file-resources in hiera.

## Usage

```
sc_files::files:
  '/tmp/test/':
    enusre: present
    content: 'foo'
```
