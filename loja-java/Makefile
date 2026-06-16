JAVAC = javac
JAVA  = java

SRC_MAIN = src/main/java
SRC_TEST = src/test/java
OUT      = build

all:
	mkdir -p $(OUT)
	$(JAVAC) -d $(OUT) $(SRC_MAIN)/loja/*.java

run: all
	$(JAVA) -cp $(OUT) loja.Main

test: all
	$(JAVAC) -cp $(OUT) -d $(OUT) $(SRC_TEST)/loja/*.java
	$(JAVA) -cp $(OUT) loja.TestLoja

clean:
	rm -rf $(OUT)

.PHONY: all run test clean
