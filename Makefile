Geoff.jar: Student.java
	javac -d ./build Student.java
	cd build; jar -cvf Geoff.jar *
	cp build/Geoff.jar .

clean:
	rm -f Geoff.jar
	rm -rf ./build

all: Geoff.jar
