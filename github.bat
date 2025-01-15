@echo off
rem This file is generated from github.pbat, all edits will be lost
set PATH=C:\Program Files\Git\cmd;C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build;C:\Windows;C:\Windows\System32
if not exist llvm-project git clone https://github.com/llvm/llvm-project.git
call vcvars64.bat
where ninja > NUL 2>&1 || pip install ninja
pushd llvm-project
    if not exist build mkdir build
    pushd build
        cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=on -DLLVM_ENABLE_EH=on -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_INSTALL_PREFIX=C:\llvm19 ..\llvm
        ninja
    popd
popd
call vcvars64.bat
pushd llvm-project\build
    ninja install
popd