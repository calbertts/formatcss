rm ./formatcss
time qjsc \
  -o formatcss \
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

chmod a+x ./formatcss
