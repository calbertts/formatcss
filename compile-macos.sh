rm ./formatcss-macos
time qjsc \
  -o formatcss-macos \
  -fno-string-normalize \
  -fno-map \
  -fno-promise \
  -fno-typedarray \
  -fno-typedarray \
  -fno-eval \
  -fno-proxy \
  -fno-date \
  -fno-module-loader \
  index.js

strip ./formatcss-macos
chmod a+x ./formatcss-macos
