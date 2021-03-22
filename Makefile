GHDL=ghdl
OPTIONS="--std=08"

COMPONENTS=

# append '.pack' suffix to identify packages
PACKAGES=

# tests should end with _tb
TESTS=attrs_tb

all: packages components tests
packages: $(PACKAGES)
components: $(COMPONENTS)
tests: $(TESTS)

%.pack: %.vhdl
	$(GHDL) -a $(OPTIONS) $<

%: %.vhdl
	$(GHDL) -a $(OPTIONS) $<
	$(GHDL) -e $(OPTIONS) $@

%_tb:
	$(GHDL) -a $(OPTIONS) $@.vhdl
	$(GHDL) -e $(OPTIONS) $@
	$(GHDL) -r $(OPTIONS) $@

clean:
	rm work-obj08.cf
