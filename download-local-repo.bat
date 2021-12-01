@echo off
rem $home/.m2/repository �����̃f�B���N�g�����J�X�^�� settings.xml�ɂ���ĕύX���Ă����Ƀ_�E�����[�h������B
rem ���Ԃ�v���W�F�N�g�����łɊJ���ăr���h�������Ƃ������Ă����[�J�����|�W�g���ɖ�����΃_�E�����[�h�����B
rem �K�w�\�����Č������i���ʂɃ��[�J�����|�W�g���Ȃ̂Łj����A�v���W�F�N�g�ɕK�v�Ȃ��̂����擾�ł���B
rem �i�o�[�W�������ƂɃf�B���N�g������������AMAVEN���|�W�g���ɂ́i���[�J�����܂߁j�A�d�˂Ă����΂����͂��B
rem Spring Initializr�ō�����v���W�F�N�g���Ώۂ����APROJ_DIR�� mvnw.cmd��pom.xml��������IDE�ł����Ɠ����Ȃ炽�Ԃ���v�B


rem maven Wrapper �� "%USERPROFILE%\.m2\wrapper" �Ƀ_�E�����[�h�����̂ŁA�ʓr���o���K�v������B


rem store current dir for settings.xml path.
set SETTINGSXML_DIR=%~dp0


rem JAVA_HOME for run mvn.
echo "Set JAVA_HOME"
set JAVA_HOME=%~dp0\..\jdk\corretto\jdk17.0.1_12


echo "Set Download Location"
rem �d�v�F �����������Ώo�͐�B���̊��ϐ��� settings.xml�Ŏg����B�i���̃o�b�`�ɖ�������ƌ����ď����Ă͂Ȃ�Ȃ��I�ȈӖ��ŏd�v�j�B
rem Important! : Location for download. this env var used by .\settings.xml ( `<localRepository>${env.ALT_MAVEN_LOCAL_REPO_PARENT_DIR}\.m2\repository</localRepository>` ).
rem if you change following line to 'set ALT_MAVEN_LOCAL_REPO_PARENT_DIR=c:\tmp' files will be downloaded in 'c:\tmp\.m2\repository\'
set ALT_MAVEN_LOCAL_REPO_PARENT_DIR=%~dp0


echo "Set PROJ_DIR for this bat"
rem PROJ_DIR�́Amvnw.cmd �� pom.xml �����݂��邱�Ɓi������� mvnw.cmd�t�@�C�������łȂ����ꂪ�Q�Ƃ��� .mvn�f�B���N�g���Ȃ� mavenWrapper�������\���ł��邱�Ɓj
set PROJ_DIR=%~dp0\..\demopoc



echo "Enter %PROJ_DIR%"
pushd "%PROJ_DIR%"
call mvnw -s "%SETTINGSXML_DIR%\settings.xml" dependency:resolve


echo "LEAVE %PROJ_DIR%"
popd

pause
