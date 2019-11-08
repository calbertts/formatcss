import * as std from 'std'
import { cssbeautify } from 'cssbeautify.js'
import { parseCommandLineOpts } from 'minimist.js'

const args = parseCommandLineOpts(scriptArgs)
const file = args.file ? std.open(args.file, 'r') : std.in

let line = file.getline()
let fullCSS = ''

while(line) {
  if (line.trim() === '')
    std.exit()

  fullCSS += line
  line = file.getline()
}

print(cssbeautify(fullCSS))
