rem jar�������t���b�g�Ƀ_�E�����[�h����B�K�w�\���͍���Ȃ��B
rem �ŏ��ɂ��߂������ǁA������̕������|�W�g���̍Č��ɂ͓K���Ă���̂Ŏg��Ȃ��Ȃ����B

set JAVA_HOME=%~dp0\..\jdk\corretto\jdk17.0.1_12
set PROJ_DIR=%~dp0\..\demopoc

pushd "%PROJ_DIR%"
call mvnw dependency:copy-dependencies
popd
