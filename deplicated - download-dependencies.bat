rem jarだけをフラットにダウンロードする。階層構造は作られない。
rem 最初にためしたけど、もう一個の方がリポジトリの再現には適しているので使わなくなった。

set JAVA_HOME=%~dp0\..\jdk\corretto\jdk17.0.1_12
set PROJ_DIR=%~dp0\..\demopoc

pushd "%PROJ_DIR%"
call mvnw dependency:copy-dependencies
popd
