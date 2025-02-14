# buildQt 从源代码自动构建Qt

## 说明
1. 本项目的主要目的是从源代码构建Qt的二进制版本(使用GithubActions自动构建)
2. 主要针对开源版本的Qt5、Qt6版本
3. 主要构建Windows版本(使用MSVC、MinGW64、LLVM-MinGW三大编译器)
4. 主要构建static版本
5. 主要构建Release版本

## 版本
1. 无"RP"版本：从Qt完整源代码构建，构建绝大部分组件
2. 有"RP"版本：从Qt组件源代码构建，目前只构建qtbase、qttools、qttranslations、qtsvg共4个组件

## 仓库地址
1. Github: https://github.com/yuanpeirong/buildQt

## 目前已支持Qt6 完整版本
1. Qt6.8.2 msvc2022_64
2. Qt6.8.2 MinGW1310_64               (使用Qt官方默认编译器版本)
3. Qt6.8.2 MinGW1420_64(UCRT)    
4. Qt6.8.2 LLVM-MinGW17.0.6(UCRT)
5. Qt6.8.2 LLVM-MinGW19.1.7(UCRT)     (使用Qt官方默认编译器版本)

## 目前已支持Qt6 RP版本
1. Qt6.8.2 msvc2022_64_RP
2. Qt6.8.2 MinGW1310_64_RP            (使用Qt官方默认编译器版本)
3. Qt6.8.2 MinGW1420_64_RP(UCRT)
4. Qt6.8.2 LLVM-MinGW17.0.6_RP(UCRT)  (使用Qt官方默认编译器版本)
5. Qt6.8.2 LLVM-MinGW19.1.7_RP(UCRT)

## 目前已支持Qt5 完整版本
1. Qt5.15.16 msvc2022_64     
2. Qt5.15.16 MinGW810_64              (使用Qt官方默认编译器版本)
3. ~~Qt5.15.16 MinGW1420_64(UCRT)~~


## 目前已支持Qt5 RP版本
1. Qt5.15.16 msvc2022_64_RP
2. Qt5.15.16 MinGW810_64_RP           (使用Qt官方默认编译器版本)
3. Qt5.15.16 MinGW1420_64_RP(UCRT)