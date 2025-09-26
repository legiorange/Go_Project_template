#!/bin/bash

# 定义新项目的名称（用于创建根目录）
PROJECT_NAME="new-go-project"

# 检查参数：允许用户指定项目名称
if [ -n "$1" ] && [ "$1" != "-x" ]; then
    PROJECT_NAME="$1"
    echo "使用传入参数作为项目名称：$PROJECT_NAME"
	# 创建根目录并进入
	mkdir -p "$PROJECT_NAME"
	cd "$PROJECT_NAME"
elif [ "$1" == "-x" ]; then
    # 使用 Shell 参数扩展获取当前目录名
    PROJECT_NAME=${PWD##*/}
    echo "使用当前目录名作为项目名称：$PROJECT_NAME"
else
    echo "未指定参数，使用默认项目名称：$PROJECT_NAME"
	# 创建根目录并进入
	mkdir -p "$PROJECT_NAME"
	cd "$PROJECT_NAME"
fi



echo "--- 正在为项目 '$PROJECT_NAME' 创建脚手架结构... ---"

# --- 核心目录 ---
mkdir -p cmd/server       # 应用程序入口
mkdir -p internal/{app,config,handler,repository,router} # 内部私有包
mkdir -p pkg/{logger,utils} # 可复用的公共库
mkdir -p scripts          # 脚本
mkdir -p test             # 测试数据/脚本
mkdir -p bin              # 构建输出目录

# --- 核心文件 ---

# 1. 创建 go.mod
MODULE_NAME="github.com/your-username/$PROJECT_NAME"
echo "module $MODULE_NAME" > go.mod
echo "go 1.21" >> go.mod
echo "创建 go.mod 文件，模块名为：$MODULE_NAME"

# 2. 创建主程序入口文件
cat <<EOF > cmd/server/main.go
package main

import "fmt"

func main() {
    fmt.Println("🚀 Go Project Scaffold Initialized!")
    // TODO: Add config loading, router setup, and server start logic.
}
EOF
echo "创建 cmd/server/main.go 文件"

# 3. 创建 README 文件
cat <<EOF > README.md
# $PROJECT_NAME

## 简介
这是一个基于标准 Go 布局的可复用项目脚手架。

## 快速开始

### 1. 初始化 Go Module (仅首次)
\`\`\`bash
go mod tidy
\`\`\`

### 2. 构建与运行
\`\`\`bash
make run
\`\`\`
EOF
echo "创建 README.md 文件"

# 4. 创建 Makefile
cat <<EOF > Makefile
.PHONY: all build run test clean

# --- 变量定义 ---
APP_NAME := $PROJECT_NAME
BUILD_DIR := bin
MAIN_PATH := ./cmd/server 
LDFLAGS := -ldflags="-s -w" 

# --- 默认目标 ---
all: build

# 编译应用
build:
	@echo "--- 正在构建 \$(APP_NAME)... ---"
	go build \$(LDFLAGS) -o \$(BUILD_DIR)/\$(APP_NAME) \$(MAIN_PATH)
	@echo "--- 构建成功：\$(BUILD_DIR)/\$(APP_NAME) ---"

# 运行应用
run: build
	@echo "--- 正在运行 \$(APP_NAME)... ---"
	./\$(BUILD_DIR)/\$(APP_NAME)

# 运行所有测试
test:
	@echo "--- 运行所有测试... ---"
	go test -v ./...

# 清理构建产物
clean:
	@echo "--- 正在清理构建产物... ---"
	@rm -rf \$(BUILD_DIR)
	@echo "--- 清理完成。 ---"
EOF
echo "创建 Makefile 文件"

echo "✅ 脚手架结构已成功生成在 ./$PROJECT_NAME 目录！"
echo ""
echo "下一步：进入目录并运行 'go mod tidy' 初始化依赖。"
echo "       cd $PROJECT_NAME"
echo "       go mod tidy"