@echo off
setlocal
set MSYS2_PATH=C:\msys64\ucrt64\bin
set PATH=%MSYS2_PATH%;%PATH%
if not exist build mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_POLICY_DEFAULT_CMP0091=NEW -DCMAKE_POLICY_DEFAULT_CMP0135=NEW -DCMAKE_POLICY_DEFAULT_CMP0169=NEW
cmake --build . --config Debug
endlocal