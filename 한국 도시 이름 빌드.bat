@echo off
title �ѱ� ���� �̸� ���� (using NML0.2.2)
echo �ѱ� ���� �̸��� �����մϴ�. ����Ͻðڽ��ϱ�?
pause

:first_level
echo.
echo #1. NML ������
echo �������� �����մϴ�.....
echo ����������������������������������������������������������
"..\NML\0.2.2\nmlc.exe" --custom-tags="./custom_tags.txt" --lang-dir="./lang/" --grf="./ko_town_names.grf" --nfo="./ko_town_names.nfo" "./ko_town_names.nml"
echo.
if ERRORLEVEL 1 (
	echo [���] ����!! �����Ͽ� �����Ͽ����ϴ�!
	goto stop_process
) else (
	echo [���] �����Ͽ� �����Ͽ����ϴ�.
)
echo ����������������������������������������������������������
echo.
echo.
echo.

echo #2. ���� ����
echo �ѱ� ���� �̸� ���� ������ TAR ���Ϸ� �����մϴ�.
echo ���� �޽����� ���� �ʾҴٸ� ���࿡ ������ ���Դϴ�.
echo ����������������������������������������������������������
echo (1) �ѱ� ���� �̸� ���� �ҷ�����
for /f "eol=; tokens=2 delims=:" %%i in (./custom_tags.txt) do (
	set KTN_VERSION=%%i
	goto out
)
:out
echo [���] ã�Ƴ� ����: %KTN_VERSION%
echo ����������������������������������������������������������
echo.
echo.
echo.
echo (2) ����
echo ����������������������������������������������������������
"C:\Program Files\Bandizip\bz.exe" /archive "Korean_Town_Names-%KTN_VERSION%.tar" "ko_town_names.grf" "changelog.txt" "readme.txt"
:: "C:\Program Files (x86)\ESTsoft\ALZip\alzipcon.exe" -a -nq -m0 "ko_town_names.grf";"changelog.txt";"readme.txt";"readme_en.txt" "Korean_Train_Set-%KTN_VERSION%.tar"
echo ����������������������������������������������������������
echo.
echo.
echo.

echo #3. NML ���� ���
echo ����������������������������������������������������������
xcopy /F /Y "./ko_town_names.nml" "./NML_backup/ko_town_names_%KTN_VERSION%.*"
echo [���] ko_train_%KTN_VERSION%.nml ���Ϸ� ��� �Ϸ�
echo ����������������������������������������������������������
echo.
echo.
echo.


echo �ѱ� ���� �̸� v%KTN_VERSION% ���尡 �Ϸ�Ǿ����ϴ�.

:stop_process
set /P WILL_YOU_RETRY="�ٽ� ó������ �����Ͻðڽ��ϱ�? [Y/N] ..... "
if %WILL_YOU_RETRY% == y (
	cls
	goto first_level
)

:eof
echo.
pause
exit