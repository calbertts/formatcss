rm ./formatcss
qjsc \
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

  #-fno-json \
chmod a+x ./formatcss
