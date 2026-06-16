GRADLE = gradle

compile:
	$(GRADLE) classes

run:
	$(GRADLE) run

test:
	$(GRADLE) test

jar:
	$(GRADLE) jar

clean:
	$(GRADLE) clean

deps:
	$(GRADLE) dependencies

wrapper:
	$(GRADLE) wrapper

result:
	gradle test --tests loja.TestLoja
	@echo ------------------------
	@echo ------------------------
	cat build/test-results/test/TEST-loja.TestLoja.xml

.PHONY: compile run test jar clean deps wrapper
