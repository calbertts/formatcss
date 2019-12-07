# Format CSS from Command Line

This utility uses https://github.com/senchalabs/cssbeautify to perform the beautify process

Also it uses https://github.com/substack/minimist to parse command line arguments

## How to install

This donwloads and installs the latest binary depending on your OS:

```
curl -sL https://gist.githubusercontent.com/calbertts/85d12674a21cc20f414835590a294b67/raw/92e8d3d362132ac641b0fa83489ffd6eaa56c417/install-formatcss.sh | sh
```

Dowload the release from *Releases* on GitHub

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

# requires cURL
formatcss --url https://www.w3schools.com/w3css/4/w3.css
```
As part of a pipeline:
```
cat sample.css | formatcss
cat sample.css | formatcss --indent '  '
```

## How to uninstall
Since this is a small binary with no dependencies, just remove it:
```
rm /usr/local/bin/formatcss
```

## How to build

This project requires the QuickJS compiler to be previously installed https://bellard.org/quickjs/
Then just run:
```
make
```
The result executable has ~500KB of size and will have the name of the current OS/arch/distro
