DISTDIR=dist
uname_s := $(shell uname -s)
uname_m := $(shell uname -m)
dist_m := $(shell cat /etc/*-release | grep ^ID=[A-Za-z]* | sed s/ID=/-/g | sed s/\"//g)

$(info os=$(uname_s))
$(info arch=$(uname_m))
$(info dist=$(dist_m))

formatcss:
	mkdir -p $(DISTDIR)
	qjsc \
		-o ./$(DISTDIR)/formatcss-$(uname_s)$(dist_m)-$(uname_m) \
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
	strip ./$(DISTDIR)/formatcss-$(uname_s)$(dist_m)-$(uname_m)
	chmod a+x ./$(DISTDIR)/formatcss-$(uname_s)$(dist_m)-$(uname_m)

clean:
	rm -rf $(DISTDIR)
