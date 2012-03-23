@echo off

:: Set to pack to use UPX compression
set upx=nopack

:: Set to /x64 to build for 64-bit
set x64=

:: AutoIt3Wrapper directory
set autwrapperdir=%PROGRAMFILES(X86)%\AutoIt3\SciTE\AutoIt3Wrapper

echo Building AutoIT extensions...

:: Build scripts
FOR %%G IN (*.au3) DO "%autwrapperdir%\AutoIt3Wrapper.exe" /in %%G /%upx% %x64%

:: Don't forget the Panel Creator!
"%autwrapperdir%\AutoIt3Wrapper.exe" /in "PanelCreator\PanelCreator.au3" /%upx% %x64%

:: Delete unnecessary exes
del Common.exe
del ColorChooser.exe

echo All done!
exit