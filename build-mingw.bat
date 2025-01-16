@echo off
rem This file is generated from build-mingw.pbat, all edits will be lost
set PATH=C:\Windows\System32;C:\Program Files\7-Zip;C:\Program Files\CMake\bin;C:\mingw1310_64\bin;%PATH%
move /y C:\mingw, C:\mingw_ || echo 1 > NUL
call pull-mingw
if not exist llvmorg-19.1.7.zip (
    echo downloading llvmorg-19.1.7.zip
    curl -L -o llvmorg-19.1.7.zip https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-19.1.7.zip
)
7z rn llvmorg-19.1.7.zip llvm-project-llvmorg-19.1.7 llvm-project
if not exist llvm-project 7z x -y llvmorg-19.1.7.zip
pushd llvm-project
    if not exist build mkdir build
    pushd build
        cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=on -DLLVM_ENABLE_EH=on -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_INSTALL_PREFIX=C:\llvm19 ..\llvm
        ninja
    popd
popd
pushd llvm-project\build
    ninja install
popd
7z a -y C:\llvm19 llvm19-mingw.7z