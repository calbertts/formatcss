import * as std from 'std'
import * as os from 'os'
import { cssbeautify } from 'cssbeautify.js'
import { parseCommandLineOpts } from 'minimist.js'

const args = parseCommandLineOpts(scriptArgs)

let file = std.in
if (args.file) {
  file = std.open(args.file, 'r')
}

let cssFromURL
if (args.url) {
  const request = std.urlGet(args.url, {full: true})
  if (request.status === 200) {
    if (request.response.startsWith('HTTP')) {
      const preData = request.response.split('\n\r')
      preData.shift()
      cssFromURL = preData.join('')
    } else {
      cssFromURL = request.response
    }
  }
}

let cssOpts = {
  indent: args.indent || '    ',
  openbrace: args.openbrace || 'end-of-line',
  autosemicolon: args.autosemicolon || false
}

function isEmptyFile(file) {
  if (os.isatty(file)) {
    try {
      file.seek(0, std.SEEK_END)
    } catch(err) { return true }
    if (file.tell() === 0) {
      return true
    } else {
      file.seek(0, std.SEEK_SET)
      return false
    }
  } else {
    return false
  }
}

if (!isEmptyFile(file)) {
  let line = file.getline()
  let fullCSS = ''

  while(line) {
    if (line.trim() === '')
      std.exit()

    fullCSS += line
    line = file.getline()
  }

  print(cssbeautify(fullCSS, cssOpts))
} else if (cssFromURL) {
  print(cssbeautify(cssFromURL, cssOpts))
} else {
  console.log(`\n  No CSS was found\n`)
  std.exit(1)
}
