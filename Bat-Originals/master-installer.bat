@ECHO off

::Defines
set CPUtype=xxx

:ARCHcheck
for /f "skip=1 delims=" %%x in ('wmic cpu get addresswidth') do if not defined AddressWidth set AddressWidth=%%x

if %AddressWidth%==64 (
	set CPUtype=x64
	GOTO Download
)	else	(
	set CPUtype=x86
  GOTO Download
)
GOTO End

:Download
wget -w 3 https://github.com/ViroRepo/ninite-silent/raw/master/Exe-Originals/ninite.exe --no-check-certificate --no-proxy
wget -w 3 https://github.com/ViroRepo/teamviewer-deploy/raw/master/Compiled/teamviewer.exe --no-check-certificate --no-proxy
wget -w 3 https://github.com/ViroRepo/eset-deploy/raw/master/compiled/eset3264.exe --no-check-certificate --no-proxy
Goto Install

:Install
teamviewer.exe
eset3264.exe
ninite.exe
Goto EXIT

:EXIT
exit