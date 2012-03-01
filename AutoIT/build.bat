@echo off

:: Set to pack to use UPX compression
set upx=nopack

:: AutoIt3Wrapper directory
set autwrapperdir=%PROGRAMFILES(X86)%\AutoIt3\SciTE\AutoIt3Wrapper

echo Building AutoIT extensions...

:: Build scripts
FOR /R "." %%G IN (*.au3) DO "%autwrapperdir%\AutoIt3Wrapper.exe" /in %%G /%upx%

:: For ricers: uncomment the following line and comment the above to build for X64
:: FOR /R "." %%G IN (*.au3) DO "%autwrapperdir%\AutoIt3Wrapper.exe" /in %%G /%upx% /x64

:: Delete unnecessary exe
del ColorChooser.exe

echo All done!
exit