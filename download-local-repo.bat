@echo off
rem $home/.m2/repository 相当のディレクトリをカスタム settings.xmlによって変更してそこにダウンロードさせる。
rem たぶんプロジェクトをすでに開いてビルドしたことがあってもローカルリポジトリに無ければダウンロードされる。
rem 階層構造も再現される（普通にローカルリポジトリなので）から、プロジェクトに必要なものだけ取得できる。
rem （バージョンごとにディレクトリちがうから、MAVENリポジトリには（ローカルも含め）、重ねていけばいいはず。
rem Spring Initializrで作ったプロジェクトが対象だが、PROJ_DIRに mvnw.cmdとpom.xmlがあってIDEでちゃんと動くならたぶん大丈夫。


rem maven Wrapper は "%USERPROFILE%\.m2\wrapper" にダウンロードされるので、別途取り出す必要がある。


rem store current dir for settings.xml path.
set SETTINGSXML_DIR=%~dp0


rem JAVA_HOME for run mvn.
echo "Set JAVA_HOME"
set JAVA_HOME=%~dp0\..\jdk\corretto\jdk17.0.1_12


echo "Set Download Location"
rem 重要： 平たく言えば出力先。この環境変数は settings.xmlで使われる。（このバッチに無いからと言って消してはならない的な意味で重要）。
rem Important! : Location for download. this env var used by .\settings.xml ( `<localRepository>${env.ALT_MAVEN_LOCAL_REPO_PARENT_DIR}\.m2\repository</localRepository>` ).
rem if you change following line to 'set ALT_MAVEN_LOCAL_REPO_PARENT_DIR=c:\tmp' files will be downloaded in 'c:\tmp\.m2\repository\'
set ALT_MAVEN_LOCAL_REPO_PARENT_DIR=%~dp0


echo "Set PROJ_DIR for this bat"
rem PROJ_DIRは、mvnw.cmd と pom.xml が存在すること（もちろん mvnw.cmdファイルだけでなくそれが参照する .mvnディレクトリなど mavenWrapperが動く構成であること）
set PROJ_DIR=%~dp0\..\demopoc



echo "Enter %PROJ_DIR%"
pushd "%PROJ_DIR%"
call mvnw -s "%SETTINGSXML_DIR%\settings.xml" dependency:resolve


echo "LEAVE %PROJ_DIR%"
popd

pause
