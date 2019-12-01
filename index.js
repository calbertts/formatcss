import * as std from 'std'
import * as os from 'os'
import { cssbeautify } from 'cssbeautify.js'
import { parseCommandLineOpts } from 'minimist.js'

const args = parseCommandLineOpts(scriptArgs)
let file   = std.in

if (args.file) {
  file = std.open(args.file, 'r')
}

let cssOpts = {
  indent: args.indent || '    ',
  openbrace: args.openbrace || 'end-of-line',
  autosemicolon: args.autosemicolon || false
}

function isEmptyFile(file) {
  if (os.isatty(file)) {
    file.seek(0, std.SEEK_END)
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
} else {
  console.log(`\n  No CSS was found\n`)
  std.exit(1)
}
