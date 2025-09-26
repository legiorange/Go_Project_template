# Go_Project_template
Use shell command genetate a template project.

项目结构：
my-go/
├── cmd/                # 应用程序入口（主函数）
│   └── server/         # 你的主应用（例如：Web API服务器）
│       └── main.go
├── internal/           # 仅限本项目内部使用的包（其他项目无法直接导入）
│   ├── app/            # 应用的核心业务逻辑
│   ├── config/         # 配置文件、环境变量加载
│   ├── handler/        # HTTP/gRPC请求处理层 (Controller)
│   ├── repository/     # 数据访问层 (DAO/Repository)
│   └── router/         # 路由配置
├── pkg/                # 可被外部项目导入和复用的公共库
│   ├── logger/         # 通用的日志工具
│   ├── utils/          # 通用的辅助函数
│   └── version/        # 版本信息（例如：编译信息）
├── vendor/             # Go 依赖包的本地缓存（可选）
├── scripts/            # 自动化脚本（例如：构建、部署、测试）
├── test/               # 额外的非单元测试数据/脚本
├── go.mod              # Go 模块定义文件
├── go.sum              # 依赖校验文件
├── Makefile            # 自动化命令（推荐使用）
└── README.md           # 项目说明


init.sh 使用方法：

1. 改变init.sh中的PROJECT_NAME，然后直接运行。 

```
PROJECT_NAME="new-go-project"
```

2. 通过命令自定义项目名称
```
sh init.sh [项目名称] 
```

3. 使用 -x 以当前目录名称为项目名称 .
```
sh init.sh -x
```
默认在当前目录下创建目录结构。
