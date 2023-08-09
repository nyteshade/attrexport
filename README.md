# attrexport
Extract extended attribute data as a binary file on macOS

## Overview
This is a simple command line utility that exports binary contents of an extended attribute set on a file, to file with the name and path specified by you. I got frustrated with `xattr -p` functionality and wrote this.

## Usage Information

```
USAGE: attrexport <attr-name> <src-name> <dst-name> [--overwrite]

ARGUMENTS:
  <attr-name>             The name of the extended attribute.
  <src-name>              The name of the file to read from.
  <dst-name>              The name of the file to save attribute data to.

OPTIONS:
  --overwrite             When present, this flag will allow overwrite of existing output.
  -h, --help              Show help information.
```

Basically in order to use this, simply supply the attribute name, the source file, and the destination file. Unless --overwrite is specified, the command will fail if file exists in the destination path already. The following code will generate a 32 byte com.apple.FinderInfo resource output file.

```sh
$ attrexport com.apple.FinderInfo FileWithCustomIcon FileWithCustomIcon.FinderInfo.rsrc
```
