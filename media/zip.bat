@echo off&color 1f
title ���� zip �ļ�
setlocal EnableDelayedExpansion
mode con: cols=100

set p=%~dp0
if not "%p:~-7%"=="\media\" (
echo.
echo ��zip.bat������Ŀ¼���ԣ����ڸ�������ѹ��� media Ŀ¼�����С�zip.bat����
echo.
pause
exit
)
cd /d %p%

set "v=%SystemDrive%\Program Files (x86)\WinRAR\WinRAR.exe"
if exist !v! goto MENU
set "v=!v: (x86)=!"
if exist !v! goto MENU
for /f tokens^=^2^ delims^=^" %%a in ('reg query "HKCR\WinRAR\shell\open\command" /v ""') do set v=%%a
if not exist !v! (
echo.
echo δ�ҵ� WinRAR ·�������Ȱ�װ WinRAR��
echo.
pause
exit
)

:MENU
echo.
echo  ����һ���������ֺ󰴻س�����5 �� 6 ����ͬʱ���룩
:L0
echo  ___________________________________________________________
echo.
echo  1. ���������ͼƬ�ȵ� zip �ļ�
echo.
echo. 2. ���ɡ�9ping-mp3.zip������������������������ mp3��
echo.
echo. 3. ���ɡ�jtdwh-mp3.zip�����������嵳�Ļ������� mp3��
echo.
echo. 4. ���ɡ�gczydzjmd-mp3.zip������������������ռ�Ŀ�ġ����� mp3��
echo.
echo  5. ���ɡ�zhenxiang.zip����������վ������أ�
echo.
echo  6. ���ɡ�zhenxiang.zip������ 5 ���ݶ�һЩ��
echo.
echo  7. ���·�ǽ����� zip �ļ�
echo.
set s=
set /p s=������: 
echo.
if "%s%"=="" goto L0

:L1
if "%s:1=%" == "%s%" goto L2
set p="!v!" a -y -o+ -ibck
del *-win.zip *-android.zip wrar540sc.zip 9pinggb.zip gczydzjmd.zip *-jpg.zip 1>nul 2>nul
%p% "zym-win.zip" fg*.exe
%p% "wjll-win.zip" u*.exe
%p% "wjydt-android.zip" um*.apk
%p% "zym-android.zip" fgma*.apk
%p% "iNTD_TV-android.zip" iNTD_TV.apk
%p% "lithium-android.zip" lithium.apk
%p% "adobe-android.zip" adobe.apk
%p% "vlc-android.zip" vlc.apk
%p% "rar-android.zip" rar-android.apk
%p% "wrar540sc.zip" wrar*.exe
%p% "9pinggb.zip" 9pinggb.htm
%p% "gczydzjmd.zip" gczydzjmd.htm
%p% "jbzxxl-jpg.zip" jbzxxl*.jpg
%p% "fldfhcsj-jpg.zip" fldfhcsj*.jpg
%p% "czsjm-jpg.zip" czsjm*.jpg
%p% "zcswwq-jpg.zip" zcswwq*.jpg
%p% "ysnbjhp-jpg.zip" ysnbjhp*.jpg
%p% "gyyrdyfx-jpg.zip" gyyrdyfx*.jpg
%p% "bjmh-jpg.zip" bjmh*.jpg
%p% "qsjzm-jpg.zip" qsjzm*.jpg
%p% "wsmqntd-jpg.zip" wsmqntd*.jpg
%p% "nbdsfgls-jpg.zip" nbdsfgls*.jpg

:L2
if "%s:2=%" == "%s%" goto L3
del 9ping-mp3.zip 1>nul 2>nul
"!v!" a -y -o+ -ibck "9ping-mp3.zip" *9ping*.mp3

:L3
if "%s:3=%" == "%s%" goto L4
del jtdwh-mp3.zip 1>nul 2>nul
"!v!" a -y -o+ -ibck "jtdwh-mp3.zip" *jtdwh*.mp3

:L4
if "%s:4=%" == "%s%" goto L5
del gczydzjmd-mp3.zip 1>nul 2>nul
"!v!" a -y -o+ -ibck "gczydzjmd-mp3.zip" *gczydzjmd*.mp3

:L5
set b=0
if "%s:5=%" == "%s%" (
if "%s:6=%" == "%s%" goto L7
set b=1
)
if exist ����\ rd /s /q ����\

set p= /y /k /f /r
xcopy ˵��.txt ����\ %p%
xcopy *.apk ����\���\ %p%
del ����\���\iNTD_TVsp1.apk
xcopy *.exe ����\���\ %p%
xcopy *.epub ����\������\ %p%
xcopy jbzxxl*.jpg ����\ͼƬ\��������ϵ��\ %p%
xcopy fldfhcsj*.jpg ����\ͼƬ\���ִ󷨺봫����\ %p%
xcopy czsjm*.jpg ����\ͼƬ\����ʯ����\ %p%
xcopy zcswwq*.jpg ����\ͼƬ\�߳�˼ά����\ %p%
xcopy ysnbjhp*.jpg ����\ͼƬ\һ���ܱ�����ƭ\ %p%
xcopy gyyrdyfx*.jpg ����\ͼƬ\����Ե�˵�һ����\ %p%
xcopy bjmh*.jpg ����\ͼƬ\��������\ %p%
xcopy qsjzm*.jpg ����\ͼƬ\�������ؿ������߽����񡷽�ѡ\ %p%
xcopy wsmqntd*.jpg ����\ͼƬ\ΪʲôȰ���˵�\ %p%
xcopy nbdsfgls*.jpg ����\ͼƬ\���Ѷ��ķ�����˭\ %p%

if !b!==1 (
echo f|xcopy weihuo.mp4 "����\��Ƶ\α�� - �찲���Է��¼�����.mp4" %p%
echo f|xcopy 9ping.pdf ����\����������.pdf %p%
)
echo f|xcopy gczydzjmd.htm ����\����������ռ�Ŀ��.htm %p%

if exist zhenxiang.zip del zhenxiang.zip
"!v!" a -y -o+ -ibck -r -x*\wrar*.exe zhenxiang.zip ����\
if exist ����\ rd /s /q ����\

:L7
if "%s:7=%" == "%s%" goto L
set p="!v!" a -y -o+ -ibck
del zym-win.zip wjll-win.zip wjydt-android.zip zym-android.zip iNTD_TV-android.zip 1>nul 2>nul
%p% "zym-win.zip" fg*.exe
%p% "wjll-win.zip" u*.exe
%p% "wjydt-android.zip" um*.apk
%p% "zym-android.zip" fgma*.apk
%p% "iNTD_TV-android.zip" iNTD_TV.apk

:L
echo.
echo ���
pause
goto L0
