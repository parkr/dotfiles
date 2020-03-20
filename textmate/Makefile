TMBUNDLE_ROOT=$(HOME)/Library/Application Support/Textmate/Bundles

install: textmate

textmate: kuroir/SCSS.tmbundle \
  hajder/Ensure-New-Line-at-the-EOF.tmbundle \
  bomberstudios/Strip-Whitespace-On-Save.tmbundle \
  aurynn/Terraform.tmbundle \
  jjeising/javascript-jsx.tmbundle
	test -d "$(TMBUNDLE_ROOT)/Cucumber.tmbundle" || \
	  git clone https://github.com/cucumber/cucumber-tmbundle "$(TMBUNDLE_ROOT)/Cucumber.tmbundle"
	test -d "$(TMBUNDLE_ROOT)/rubocop.tmbundle" || \
	  git clone https://github.com/mrdougal/textmate2-rubocop "$(TMBUNDLE_ROOT)/rubocop.tmbundle"
	test -d "$(TMBUNDLE_ROOT)/protobuf-tmbundle" || \
	  git clone https://github.com/michaeledgar/protobuf-tmbundle "$(TMBUNDLE_ROOT)/protobuf-tmbundle"
	test -L "$(TMBUNDLE_ROOT)/Protocol Buffers.tmbundle" || \
	  ln -s "$(TMBUNDLE_ROOT)/protobuf-tmbundle/Protocol Buffers.tmbundle" "$(TMBUNDLE_ROOT)/Protocol Buffers.tmbundle"
	test -L "$(TMBUNDLE_ROOT)/GraphQL.tmbundle" || \
	  git clone https://github.com/graphql-python/GraphQL-SublimeText "$(TMBUNDLE_ROOT)/GraphQL.tmbundle"

%.tmbundle:
	$(eval $@_bundlename := $(shell basename $*).tmbundle)
	$(eval $@_repo := $*.tmbundle)
	test -d "$(TMBUNDLE_ROOT)/$($@_bundlename)" || \
	  git clone https://github.com/$($@_repo) "$(TMBUNDLE_ROOT)/$($@_bundlename)"
