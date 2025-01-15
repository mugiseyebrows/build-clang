@echo off
rem This file is generated from github.pbat, all edits will be lost
set PATH=C:\Program Files\Git\cmd;C:\Miniconda3;C:\Miniconda3\Scripts;%USERPROFILE%\Miniconda3;%USERPROFILE%\Miniconda3\Scripts;C:\mingw1310_64\bin;C:\Windows;C:\Windows\System32
move /y C:\mingw C:\mingw_
call pull-mingw
if not exist llvm-project git clone --depth 1 https://github.com/llvm/llvm-project.git
where ninja > NUL 2>&1 || pip install ninja
pushd llvm-project
    if not exist build mkdir build
    pushd build
        cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=on -DLLVM_ENABLE_EH=on -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_INSTALL_PREFIX=C:\llvm19 ..\llvm
        ninja
    popd
popd
where ninja > NUL 2>&1 || pip install ninja
pushd llvm-project\build
    ninja install
popd