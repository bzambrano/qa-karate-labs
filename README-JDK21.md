# JDK 21 — Instalación y configuración rápida

Este proyecto ya apunta a Java 21 en `pom.xml` (`<java.version>21</java.version>`), pero tu entorno local está usando Java 17. Para continuar creando y ejecutando tests con JDK 21, sigue uno de los caminos siguientes.

Opciones recomendadas:

- **Instalar JDK 21 localmente (Windows / Chocolatey)**

  Abre PowerShell o CMD como administrador y ejecuta:

  ```powershell
  choco install temurin-21-jdk -y
  ```

  Luego establece `JAVA_HOME` (ajusta la ruta si difiere):

  ```powershell
  setx JAVA_HOME "C:\Program Files\Eclipse Adoptium\jdk-21"
  ```

  Cierra y vuelve a abrir la terminal, luego verifica:

  ```powershell
  java -version
  mvn -version
  ```

- **Usar Maven Toolchains** (útil si necesitas múltiples JDKs en la misma máquina)

  1. Copia `toolchains.xml.example` a `%USERPROFILE%\.m2\toolchains.xml` (Windows) o `~/.m2/toolchains.xml` (Linux/macOS).
  2. Edita la ruta `<jdkHome>` dentro del archivo para apuntar al JDK 21 instalado.
  3. Maven usará esa instalación para compilación si el `pom.xml` está configurado para toolchains.

Archivo de ejemplo incluido: `toolchains.xml.example`.

Si quieres, puedo:

- Intentar instalar JDK 21 ahora en esta máquina (requiere permiso).  
- Añadir configuración de `maven-toolchains-plugin` al `pom.xml` para forzar el uso de JDK 21 cuando exista.

Dime cuál prefieres y procedo.
