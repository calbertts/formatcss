import * as std from 'std'
import { cssbeautify } from 'cssbeautify.js'

var line = std.in.getline()
var fullCSS = ''

while(line) {
  if (line.trim() === '')
    std.exit()

  fullCSS += line
  line = std.in.getline()
}

print(cssbeautify(fullCSS))
