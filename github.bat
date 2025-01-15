@echo off
rem This file is generated from github.pbat, all edits will be lost
set PATH=C:\Program Files\Git\cmd;C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build;C:\Miniconda3;C:\Miniconda3\Scripts;%USERPROFILE%\Miniconda3;%USERPROFILE%\Miniconda3\Scripts;C:\Program Files\CMake\bin;C:\Windows;C:\Windows\System32
if not exist llvm-project git clone --depth 1 https://github.com/llvm/llvm-project.git
call vcvars64.bat
where ninja > NUL 2>&1 || pip install ninja
pushd llvm-project
if not exist build mkdir build
pushd build
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=on -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_INSTALL_PREFIX=C:\llvm18 ..\llvm
    ninja
    ninja install
popd
popd