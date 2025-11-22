# HalloChat-Squirrel

Squirrel是HalloChat的Qt架构版本，使用QML和C++开发，支持跨平台运行。
请注意，原先的HalloChat-Qt仓库即将注销，开发将在Squirrel仓库继续进行。

## 项目结构
```
Squirrel/
├── src/           # C++源代码
├── qml/           # QML界面文件
├── include/       # 头文件
├── resources/     # 资源文件（图片、图标等）
├── CMakeLists.txt # 项目配置文件
└── qml.qrc        # QML资源配置
```

## 编译步骤
### 前提条件
- 已安装Qt 6.10+（包含QML和Quick模块）
- 已安装MinGW编译器
- 已安装CMake 3.16+

### 使用MinGW编译
1. 打开PowerShell，进入项目目录：
   ```powershell
   cd d:\CodeWorkspace\Squirrel
   ```

2. 创建并进入构建目录：
   ```powershell
   mkdir build && cd build
   ```

3. 运行CMake生成Makefile：
   ```powershell
   cmake .. -G "MinGW Makefiles" -DCMAKE_PREFIX_PATH="D:/Qt/6.10.0/mingw81_64"
   ```
   > 注意：请将`D:/Qt/6.10.0/mingw81_64`替换为你的Qt实际安装路径。

4. 开始编译：
   ```powershell
   mingw32-make -j4
   ```
   > `-j4`表示使用4个线程并行编译，可以根据你的CPU核心数调整

5. 编译完成后，可执行文件位于`build/debug/Squirrel.exe`或`build/release/Squirrel.exe`

6. 运行应用程序：
   ```powershell
   .\debug\Squirrel.exe
   ```

## 注意事项
- 登录界面和主界面目前是基础版本，需要进一步完善功能
- 确保`resources`目录中包含`icon.png`和`logo.png`图片文件
- 如果遇到Qt模块找不到的错误，请检查CMakeLists.txt中的Qt路径配置
- 端口占用问题可以使用以下命令查找并关闭占用进程：
  ```powershell
  netstat -ano | findstr :端口号
  taskkill /PID 进程ID /F
  ```
