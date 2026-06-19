# cc-kit

一套 Claude Code 配置增强包。安装后，Claude Code 的工作方式更结构化：有专职的 agent 分工、有调试流程、有代码审查规范、有 TDD 技能、还有 handover 机制。

## 两层结构

- **global/**：对所有项目生效。安装后 symlink 到 `~/.claude/`。包含全局 agent（executor、fetcher）、规则（agent 调度、subagent 合同）、以及多个 skills（brainstorm、grill、diagnose、tdd、teach 等）。
- **project/**：只对一个编程项目生效。复制到目标项目的 `.claude/` 目录。包含编程专用 agent（coder、fact-checker、5 个 reviewer）和编码工作流规则。

## 安装

```bash
git clone https://github.com/your-username/cc-kit.git
cd cc-kit

# 只安装 global 层（所有项目生效）
./install.sh

# 同时安装 project 层到某个项目
./install.sh --project /path/to/your/project
```

安装会自动备份已有文件（加 `.bak.时间戳` 后缀），不会直接覆盖。

## 各组件说明

### Global agents
- `executor` — 批量文件操作、清理、执行计划，不写应用代码
- `fetcher` — 抓取网页或 GitHub 资源，返回结构化摘要

### Global rules
- `agent-dispatch` — 主会话如何分派 agent 的规则
- `subagent-contract` — subagent 行为约束

### Global skills
调用方式：对话中说 "use brainstorm skill" 或类似。

- `brainstorm` — 用苏格拉底问答把粗糙想法变成设计方案
- `grill` — 压力测试计划，逐一解决决策树的每个分支
- `diagnose` — 分层调试循环：triage 先，升级到完整流程
- `tdd` — 红绿重构循环，测试行为而不是实现
- `teach` — 多会话教学工作区，含 mission、lesson、学习记录
- `improve-codebase-architecture` — 找深化机会，减少浅层模块
- `writing-plans` — 为零上下文的工程师写可执行的分步计划
- `ho` — 会话结束 handover，整理 HANDOVER.md 和 PARK.md
- `git-guardrails-claude-code` — 设置钩子阻止危险 git 命令

### Project agents
- `coder` — 主要编码执行者，读规格写代码跑测试
- `fact-checker` — 跑测试、核对 git log、生成 review 基线
- `blind-reviewer` — 只看目标和结果清单，推断 gap
- `code-quality-reviewer` — 读代码找逻辑 bug 和缺失安全网
- `design-traceability-auditor` — 把 DESIGN.md 条目对应到代码证据
- `product-blind-reviewer` — 只看代码评判产品质量

## 自定义

**CLAUDE.md 由你自己写**——cc-kit 不包含这个文件。CLAUDE.md 是你的项目身份和偏好，每个项目都不一样。

推荐结构：
```
your-project/
├── CLAUDE.md          ← 你写：项目目标、persona、工作习惯
└── .claude/           ← install.sh 安装的内容
    ├── agents/
    └── rules/
```

在 CLAUDE.md 里写什么：
- 项目是什么、目标是什么
- 你希望 Claude 以什么风格工作
- 项目特有的路径、约定、注意事项

在 `.claude/rules/` 里改什么：
- `workflow.md` — 调整计划/执行/测试流程
- `lesson.md` — 追加项目特有的教训
- `response.md` — 调整报告风格

如果你不用 Codex，coder agent 处理所有编码任务，不需要额外配置。

## 更新

```bash
cd cc-kit
git pull

# Global 层自动更新（symlink 指向最新文件）

# Project 层需要重新安装到每个项目
./install.sh --project /path/to/your/project
```
