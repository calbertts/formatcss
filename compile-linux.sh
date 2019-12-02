rm ./formatcss-ubuntu
time qjsc \
  -m \
  -o formatcss-ubuntu \
  -fno-string-normalize \
  -fno-map \
  -fno-promise \
  -fno-typedarray \
  -fno-typedarray \
  -fno-eval \
  -fno-proxy \
  -fno-date \
  index.js

strip -s ./formatcss-ubuntu
chmod a+x ./formatcss-ubuntu
