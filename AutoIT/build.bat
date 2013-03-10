@echo off

:: Set to pack to use UPX compression
set upx=nopack

:: Set to /x64 to build for 64-bit
set x64=

:: AutoIt3Wrapper directory
for /f "skip=1 delims=" %%x in ('wmic cpu get addresswidth') do if not defined AddressWidth set AddressWidth=%%x

if %AddressWidth%==64 (
	set "autwrapperdir=%PROGRAMFILES(X86)%\AutoIt3\SciTE\AutoIt3Wrapper"
) else (
	set "autwrapperdir=%PROGRAMFILES%\AutoIt3\SciTE\AutoIt3Wrapper"
)

:: Build scripts
echo Building AutoIT extensions...
FOR %%G IN (*.au3) DO "%autwrapperdir%\AutoIt3Wrapper.exe" /in %%G /%upx% %x64%

echo All done!
exit