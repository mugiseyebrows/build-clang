@echo off
rem This file is generated from github.pbat, all edits will be lost
set PATH=C:\Program Files\Git\cmd;C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build;%PATH%
if not exist llvm-project git clone --depth 1 https://github.com/llvm/llvm-project.git
dir C:\llvm18 || echo ok
call vcvars64.bat
pushd llvm-project
if not exist build mkdir build
pushd build
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=on -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_INSTALL_PREFIX=C:\llvm18 ..\llvm
    ninja
    ninja install
popd
popd