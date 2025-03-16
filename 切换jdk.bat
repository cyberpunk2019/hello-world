@echo off
chcp 65001

REM 获取当前Java版本输出
for /f "tokens=*" %%v in ('java -version 2^>^&1') do (
    echo %%v
)

REM 提示用户输入要切换的JDK版本
echo 输入你要切换的版本 (8 or 11 or 17):
set /p version=

REM 根据用户输入切换JDK版本
if "%version%"=="8" (
    set JAVA_HOME=D:\java\init\jdk8
    echo 切换到JDK 8
) else if "%version%"=="11" (
    set JAVA_HOME=D:\java\init\jdk11
    echo 切换到JDK 11
) else if "%version%"=="17" (
    set JAVA_HOME=D:\java\init\jdk17
    echo 切换到JDK 17
)else (
    echo 错误输入，请输入'8'或'11'或'17'
    exit /b 1
)

REM 设置并验证Java环境变量
setx JAVA_HOME "%JAVA_HOME%" /M

REM 等待用户输入，确保窗口保持打开状态
echo Press any key to exit...
pause >nul