@chcp 65001
@cd /d %~dp0

:: 设置Qt版本
SET QT_VERSION=6.8.2

:: 设置MinGW版本代号
SET MinGW_VERSION=mingw1310_64

:: 设置编译器和Ninja
SET PATH=D:\a\buildQt\Tools\mingw1310_64\bin;D:\a\buildQt\ninja;D:\a\buildQt\buildQt\tools;%PATH%

:: 设置Qt文件夹路径
SET QT_PATH=D:\a\buildQt\Qt

::----------以下无需修改----------

:: 设置Qt源代码目录
SET SRC_QT="%QT_PATH%\%QT_VERSION%\qt-everywhere-src-%QT_VERSION%"

:: 设置安装文件夹目录
SET INSTALL_DIR="%QT_PATH%\%QT_VERSION%-static\%MinGW_VERSION%"

:: 设置build文件夹目录
SET BUILD_DIR="%QT_PATH%\%QT_VERSION%\build-%MinGW_VERSION%"

:: 根据需要进行全新构建
rmdir /s /q "%BUILD_DIR%"
:: 定位到构建目录：
mkdir "%BUILD_DIR%" && cd /d "%BUILD_DIR%"

:: 安装 html5lib
pip install html5lib

:: 安装 依赖
pacman -S mingw-w64-x86_64-flex mingw-w64-x86_64-bison mingw-w64-x86_64-gperf

:: configure
call %SRC_QT%\configure.bat -static -release -prefix %INSTALL_DIR% -nomake examples -nomake tests -opensource -confirm-license -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre -qt-freetype -schannel -platform win32-g++

:: 编译(不要忘记点)
cmake --build . --parallel

:: 安装(不要忘记点)
cmake --install .

::复制qt.conf
copy %~dp0\qt.conf %INSTALL_DIR%\bin

SET PATH=D:\a\buildQt\Tools\mingw1310_64\bin;D:\a\buildQt\ninja;D:\a\buildQt\buildQt\tools;%INSTALL_DIR%\bin;%PATH%
git clone --recursive https://github.com/stdware/qwindowkit
cd qwindowkit
cmake -B build -S . -DCMAKE_PREFIX_PATH=%INSTALL_DIR%\bin -DCMAKE_INSTALL_PREFIX=D:/qwindowkit -DQWINDOWKIT_BUILD_STATIC=TRUE -G "MinGW Makefiles"
cmake --build build --target install --config Release

::@pause
@cmd /k cd /d %INSTALL_DIR%
