# Format CSS from Command Line

This utility uses https://github.com/senchalabs/cssbeautify to perform the beautify process

Also it uses https://github.com/substack/minimist to parse command line arguments

## How to install

Dowload the release from *Releases* on GitHub
An automated way from command line will be implemented soon

## How to use

##### Available options:
- **file**
- **indent**: by default 4 spaces
- **openbrace**: _'end-of-line'_ (default) or _'separate-line'_
- **autosemicolon**: false by default

The utility can be used as a command line program independently or can be part of a pipeline, examples:
```
formatcss --file sample.css
formatcss --file sample.css --indent '  '
formatcss --file sample.css --openbrace end-of-line
formatcss --file sample.css --autosemicolon
```
As part of a pipeline:
```
cat sample.css | formatcss
cat sample.css | formatcss --indent '  '
```

## How to build

This project was made by using https://bellard.org/quickjs/
There's a `compile.sh` script included with the corresponding options
The result executable has ~500KB of size
