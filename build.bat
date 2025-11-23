@echo off
set QTDIR=D:\Qt\6.10.0\mingw64
set PATH=%QTDIR%\bin;D:\Qt\Tools\CMake_64\bin;D:\Qt\Tools\mingw1310_64\bin;%PATH%

:: 清理旧的构建文件
if exist build rmdir /s /q build

:: 创建新的构建目录并进入
mkdir build
cd build

:: 生成Makefile
qmake ..\Squirrel.pro

:: 编译项目
mingw32-make

:: 运行程序
if exist release\Squirrel.exe start release\Squirrel.exe

cd ..
