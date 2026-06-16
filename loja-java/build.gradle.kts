plugins {
    application
}

group = "br.eng.ivanlopes"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

dependencies {
    testImplementation("org.junit.jupiter:junit-jupiter:5.10.2")
}

application {
    mainClass.set("loja.Main")
}

tasks.test {
    useJUnitPlatform()
}
