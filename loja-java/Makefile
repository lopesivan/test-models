JAVAC = javac
JAVA  = java
SRC   = src/main/java
OUT   = build

all:
	mkdir -p $(OUT)
	$(JAVAC) -d $(OUT) $(SRC)/loja/*.java

run: all
	$(JAVA) -cp $(OUT) loja.Main

clean:
	rm -rf $(OUT)

.PHONY: all run clean
