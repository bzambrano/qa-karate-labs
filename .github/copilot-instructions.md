<!-- Copilot instructions for this repository: concise, actionable, project-specific. -->
# Instrucciones rápidas para agentes AI

Resumen: este repositorio contiene un pequeño proyecto Maven centrado en pruebas Karate (BDD). El artefacto principal son tests bajo `src/test/java` que combinan runners Java y archivos `.feature` de Karate. El objetivo usual de los cambios es actualizar dependencias y la versión de Java en `pom.xml`, ejecutar `mvn test`, y revisar los informes en `target/karate-reports`.

- **Stack**: Java (propiedad `java.version` en `pom.xml`, actualmente 17), Maven, Karate (`karate.version` = 1.5.0).
- **Dónde mirar primero**: `pom.xml` (propiedades: `java.version`, `maven.compiler.version`, `karate.version`), `src/test/java` (runners y features), `target/karate-reports` (informes HTML y JSON generados).

Patrones y convenciones específicas
- `src/test/java` sirve como carpeta de recursos de prueba: el `pom.xml` declara un `<testResource>` apuntando a `src/test/java` y excluye `**/*.java`. Por tanto, los archivos `.feature` se colocan en `src/test/java` junto a los runners Java.
- Hay dos estilos de ejecución de pruebas en el repo:
  - `ExamplesTest.java`: usa `com.intuit.karate.Runner.path("classpath:examples").parallel(5)` para ejecución paralela.
  - `UsersRunner.java`: usa el adaptador `com.intuit.karate.junit5.Karate` (anotación `@Karate.Test`) y corre una feature por runner.
- Los resultados y artefactos de reporte se escriben en `target/karate-reports` y en carpetas con sufijo `_timestamp` dentro de `target`.

Comandos de desarrollo y diagnóstico
- Compilar y ejecutar pruebas (local):
  ```bash
  mvn test
  ```
- Forzar una compilación limpia y pruebas:
  ```bash
  mvn clean test
  ```
- Si cambias `java.version` en `pom.xml`, asegúrate de tener JDK 21 instalado y en `PATH` o especifica `JAVA_HOME` antes de ejecutar Maven:
  ```bash
  set JAVA_HOME=C:\path\to\jdk-21
  mvn -v
  mvn -DskipTests=false clean test
  ```

Puntos importantes al editar el proyecto
- Para actualizar la versión de Java: modifica la propiedad `<java.version>` en `pom.xml`. El `maven-compiler-plugin` ya usa esa propiedad en `<source>` y `<target>`.
- No muevas las `.feature` fuera de `src/test/java` sin actualizar el bloque `<testResource>` en `pom.xml` — las pruebas esperan encontrarlas en el classpath bajo `examples/...`.
- Las versiones y plugins se gestionan por propiedades: `maven.compiler.version`, `maven.surefire.version`, `karate.version`. Actualiza la propiedad correspondiente y luego prueba la build.

Integraciones y flujos CI / GitHub
- La carpeta `.github/java-upgrade` puede aparecer al usar herramientas de upgrade automatizadas; contiene `plan.md` y resultados. No es parte del flujo normal de tests, pero contiene información útil sobre planes de migración generados por herramientas.

Consejos para agentes AI (qué cambiar, cómo comprobar)
- Cambios típicos: actualizar `<java.version>` a `21`, instalar/usar JDK 21, ejecutar `mvn -DskipTests=false clean test` y arreglar errores de compilación o tests fallidos.
- Comprobar artefactos de reporte: abrir `target/karate-reports/karate-summary.html` y el HTML del feature específico (ej. `examples.users.users.html`) para entender fallos de prueba.
- Si haces cambios en dependencias, primero ejecuta `mvn -DskipTests=true package` para identificar errores de compilación y luego ejecutar tests completos.

Referencias de archivos clave
- `pom.xml` — configuración principal de build, propiedades y plugins.
- `src/test/java/examples/ExamplesTest.java` — ejecución paralela de features.
- `src/test/java/examples/users/UsersRunner.java` — ejemplo de runner JUnit5.
- `src/test/java/examples/users/users.feature` — ejemplo de feature y convención de colocación.
- `target/karate-reports/` — donde mirar resultados y HTML reportados.

Si algo no está claro o quieres que incluya comandos CI/CD concretos (por ejemplo, para Jenkins), dime qué entorno CI usas y adapto las instrucciones.

*** Fin. ***
