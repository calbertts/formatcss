# Format CSS from Command Line

This is not intended to be fast but be small (~500KB) and portable in embedded systems and containers.
It uses https://github.com/senchalabs/cssbeautify to perform the beautify process, as well as https://github.com/substack/minimist to parse command line arguments.

## How to install

This donwloads and installs the latest binary depending on your OS (Windows isn't supported yet):

```
curl -sL https://raw.githubusercontent.com/calbertts/formatcss/master/install.sh | sh
```

Download the release from *Releases* on GitHub

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
